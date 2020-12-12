#!/bin/bash
#
# Stage 2 - Fine Mesh
# Gridded Met.
# Nowcast
# ---------------------------------------------------------------------------
SYSLOG=$1
CONFIG=$2
cycle=$3
. ${CONFIG}
. ${mainDIR}/src/logging.sh
# ---------------------------------------------------------------------------
#                       WRITING  FORT.15 AND FORT.22 
#
writeControls()
{ cntrloptn=$1            # control option
  rndr=$2                 # run directory
  # Linking control writer Perl to run dir.
  ln -fs $mainDIR/utility/control_file_gen.pl  $rndr/control_file_gen.pl
  # linking Pcalc.pm and ArraySub.pm
  ln -fs $mainDIR/utility/PERL/Date            $rndr/Date
  ln -fs $mainDIR/utility/PERL/ArraySub.pm     $rndr/ArraySub.pm
  #
  logMessage "Constructing control file in $rndr with following options:"
  echo "       $CONTROLOPTIONS" >> ${SYSLOG} 2>&1
  echo "" >> ${SYSLOG} 2>&1
  cd $rndr
  # use $CONTROLOPTIONS, don't use $cntrloptn
  perl $rndr/control_file_gen.pl $CONTROLOPTIONS >> ${SYSLOG} 2>&1
  cd -
}
# ---------------------------------------------------------------------------------
# 
#                         ADCPREP: DECOMPOSING INPUTS
# 
prepFile()
{ JOBTYPE=$1
   . $CONFIG
   ln -fs $EXEDIR/adcprep $RUNDIR/adcprep
   cd $RUNDIR
   ./adcprep --np $NCPU --${JOBTYPE} >> $RUNDIR/adcprep.log 2>&1
   cd -
}
#
# ---------------------------------------------------------------------------------
#                         
#                          PADCIRC: PARALLEL ADCIRC
runPADCIRC()
{ NP=$1
  cd $mainDIR
  . $CONFIG
  ln -s $EXEDIR/padcirc $RUNDIR/padcirc
  cd $RUNDIR
  mpirun -n $NP ./padcirc >> $RUNDIR/padcirc.log 2>&1
  cd -
}
#
# ---------------------------------------------------------------------------------

#                         
#                         PADCSWAN: PARALLEL ADCIRC + SWAN
runPADCSWAN()
{ NP=$1
  cd $mainDIR
  . $CONFIG
  ln -s $EXEDIR/padcswan $RUNDIR/padcswan
  cd $RUNDIR
  mpirun -n $NP ./padcswan >> $RUNDIR/padcswan.log 2>$1
  cd -
}
#
# ------------------------------------------------------------------------------------
#
#                                    MAIN BODY
# Passing model parameters and setting paths
. $CONFIG
workingDIR=$mainDIR$ID
cycleDIR=`cat $mainDIR$ID/currentCycle`
nowcastDIR=$mainDIR$ID/$cycleDIR/nowcast/S1        # of stage one
forecastDIR=$mainDIR$ID/$cycleDIR/forecast/S1      # of stage one
mkdir $mainDIR$ID/$cycleDIR/nowcast/S2
RUNDIR=$mainDIR$ID/$cycleDIR/nowcast/S2
nddlAttribute="off"

# Creating some blank space in the log file for readability
echo ""  >> ${SYSLOG} 2>&1
echo ""  >> ${SYSLOG} 2>&1
logMessage "Stage 2 -- Gridded Met., Nowcast, Member $member, in ${mainDIR}${ID}/$cycleDIR/$member/S2"

# Linking hotstart files
hotswan="off"
if [ $cycle -gt 1 ]; then
   lastDIR=`cat $workingDIR/currentCycle.old`
   if [ -e $mainDIR$ID/$lastDIR/nowcast/S2/PE0000/fort.67 ]; then
      ln -fs $workingDIR/$lastDIR/nowcast/S2/PE0000/fort.67 $RUNDIR/fort.67
   elif [ -e $mainDIR$ID/$lastDIR/nowcast/S2/PE0000/fort.68 ]; then
      ln -fs $workingDIR/$lastDIR/nowcast/S2/PE0000/fort.68 $RUNDIR/fort.67
   else
      fatal "Nowcast S2: swan.67/8 not found in $workingDIR/$lastDIR/nowcast/S2/PE0000/"
   fi
   if [[ $WAVES = on ]]; then
      hotswan="on"    # hotstarting swan if hot starting from previous cycle nowcast
  fi
fi
 
# Linking fort.19 to run directory for HRLA
if [ ! -z ${nowcastDIR}/fort.19_1 ]; then
   ln -s ${nowcastDIR}/fort.19_1    $RUNDIR/fort.19
else
   fatal "Non-periodic elevation boundary condition input file does not exist."
fi

# Get back to the main directory (might not be necessary though)
cd $mainDIR
. $CONFIG
ENSTORM="nowcast"

# Linking input files: grid; nodal attribute;
logMessage "Linking input files into $RUNDIR ."
ln -s ${s2_INPDIR}/${s2_grd}         $RUNDIR/fort.14

# Linking the stage two nodal attribute if specified
if [[ ! -z $s2_ndlattr && $s2_ndlattr != null ]]; then
   ln -s ${s2_INPDIR}/$s2_ndlattr    $RUNDIR/fort.13       
   nddlAttribute="on"      # For bottom friction in swan
 
   # getting the SSHAG
   cd ${mainDIR}/utility/SSHAG
      ./get-sshag.sh $CONFIG
      cp SSHAG $RUNDIR/
   cd -

   # Writing SSHAG to fort.13
   cd $RUNDIR/
   sshagVar=`cat SSHAG`
   logMessage "For $ENSTORM, stage 2, sea surface height above geoid was extracted from NOAA station $site and its value is $sshagVar"
   sed -i "s/%SSHAG%/${sshagVar}/g" fort.13
   cd -

fi

# NAM files (221/2) have been created in nowcast dir.
# Linking them into S1/2
ln -s ${nowcastDIR}/fort.221         $RUNDIR/fort.221
ln -s ${nowcastDIR}/fort.222         $RUNDIR/fort.222

# Setting up some miscellaneous paramaters
stormDir=$RUNDIR
CONTROLTEMPLATE=${s2_cntrl}
GRIDNAME=${s2_grd}
dt=${S2_dt}
nws='-12'
tides="off"
#
if [ $cycle -eq 1 ]; then
   hstime="off"         # Nowcast of the HRLA coldstarts in the 1st cycle
else
   hstime="on"          # Nowcast of the HRLA hotstart from the nowcast of last cycle.
fi
#
if [[ $WAVES = on ]]; then
   if [[ $nws = 12 ]]; then
      nws=`expr $nws + 300`     # nws = 12
   else
      nws=`expr $nws - 300`     # nws = -12
   fi
   cp ${s2_INPDIR}/swaninit.template         $RUNDIR/swaninit
fi 
cd ${mainDIR}
. ${CONFIG}

# Getting the end data from NAM file
if [[ $MODE = FORECAST ]]; then
   nowenddate=`ls $mainDIR$ID/$cycleDIR/nowcast/ | grep "NAM" | awk -F"." '{print $1}' | awk -F"_" '{print $3}' | head -1`  # is used in runday calculation
fi

# This will be used as the start date of the stage two nowcast for all cycles
if [ $cycle -eq 1 ]; then
   ls $mainDIR$ID/$cycleDIR/nowcast/ | grep "NAM" | awk -F"." '{print $1}' | awk -F"_" '{print $2}' | head -1 > $workingDIR/nowCSDATE   2>> ${SYSLOG}  # will be used as CSDATE in stage two
fi
enddate=$nowenddate

# CSDATE of S2 is the start time of the fort.221/2
if [[ $MODE = FORECAST ]]; then
   CSDATE=`cat $workingDIR/nowCSDATE`             
else
   CSDATE=$nowCSDATE
fi

# Defining other parameters read by control_file_gen.pl
CONTROLOPTIONS=" --stormDir $stormDir --scriptdir $mainDIR --cst $CSDATE --endtime 0 --dt $dt --hsformat $HOTSTARTFORMAT --controltemplate $s2_INPDIR$CONTROLTEMPLATE $OUTPUTOPTIONS --name $ENSTORM --met $MET --nws $nws --windInterval 21600 --platform $platform --enddate $enddate --hstime $hstime"
CONTROLOPTIONS="$CONTROLOPTIONS --bctype $BCTYPE --stage2_spinUp $S2SPINUP"
CONTROLOPTIONS="$CONTROLOPTIONS --gridname $GRIDNAME" # for run.properties
if [[ $WAVES = on ]]; then
   if [[ $MODE = FORECAST ]]; then
      swanStart=`ls $mainDIR$ID/$cycleDIR/nowcast/ | grep "NAM" | awk -F"." '{print $1}' | awk -F"_" '{print $2}' | head -1`
   else 
      swanStart=$nowCSDATE   # From config
   fi
   CONTROLOPTIONS="${CONTROLOPTIONS} --swandt $SWANDT --swantemplate ${s2_INPDIR}/${s2_swan26} --hotswan $hotswan --ID $ID --estuary "$estuary" --nddlAttribute $nddlAttribute --swanBottomFri $fricType --swanStart $swanStart"
fi

# writing fort.15 and fort.22
writeControls $CONTROLOPTIONS $RUNDIR

# Decomposing grid, control, and nodal attribute file
logMessage "Running adcprep to partition the mesh for $NCPU compute processors."
prepFile partmesh
logMessage "Running adcprep to partition the mesh for $NCPU compute processors."
prepFile prepall
logMessage "Running adcprep to prepare new fort.15 file."
prepFile prep15

# Linking wave hotsrat files
if [ $cycle -gt 1 ]; then
   if [[ $WAVES = on ]]; then
      logMessage "Starting copy of wahotstart files."
      # copy the subdomain hotstart files over
      # subdomain hotstart files are always binary formatted
      PE=0
      format="%04d"
      while [ $PE -lt $NCPU ]; do
            PESTRING=`printf "$format" $PE`
            if [ -e $workingDIR/$lastDIR/nowcast/S2/PE${PESTRING}/swan.67 ]; then
               cp $workingDIR/$lastDIR/nowcast/S2/PE${PESTRING}/swan.67 $RUNDIR/PE${PESTRING}/swan.68 2>> ${SYSLOG}
            elif [ -e $workingDIR/$lastDIR/nowcast/S2/PE${PESTRING}/swan.68 ]; then
               cp $workingDIR/$lastDIR/nowcast/S2/PE${PESTRING}/swan.68 $RUNDIR/PE${PESTRING}/swan.68 2>> ${SYSLOG}
            else
               fatal "Nowcast S2: swan.67/8 not found in $workingDIR/$lastDIR/nowcast/S2/PEs/"
            fi
            PE=`expr $PE + 1`
      done
      logMessage "SWAN subdomain hotstart files of $lastDIR have been all copied to $RUNDIR."
  fi
fi

# Get in run dir
cd $RUNDIR

# Submitting jobs
if [ $WAVES == on ]; then
   runPADCSWAN $NCPU
   logMessage "PADCSWAN job is submitted."
else
   runPADCIRC $NCPU
   logMessage "PADCIRC job is submitted."
fi

# Message
date_complete=`date +'%Y-%m-%d %H:%M UTC'`
logMessage "The job has completed on $date_complete"
