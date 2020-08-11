#!/bin/bash
#
CONFIG=$1
RUNDIR=$2
cycleDIR=$3
HOSTNAME=$4
ENSTORM=$5
#CSDATE=$6      # Rename to STARTDATE to avoid conflict between STARTDATE of config and the 6th arguement
STARTDATE=$6
GRIDFILE=$7   
SYSLOG=$8  
stage=$9   
#
. $CONFIG
. ${mainDIR}/src/logging.sh
#
OUTPUTDIR=$mainDIR/postProc
cd $RUNDIR
# -------------------------------------------------------------------------
#             G N U P L O T   F O R   L I N E   G R A P H S
# -------------------------------------------------------------------------

# transpose elevation output file so that we can graph it with gnuplot
STATIONELEVATION=${RUNDIR}/fort.61
if [[ -e $STATIONELEVATION || -e ${STATIONELEVATION}.nc ]]; then
   if [[ -e $STATIONELEVATION.nc ]]; then
      ${OUTPUTDIR}/netcdf2adcirc.x --datafile ${STATIONELEVATION}.nc 2>> ${SYSLOG}
   fi
   perl ${OUTPUTDIR}/station_transpose.pl --filetotranspose elevation --controlfile ${RUNDIR}/fort.15 --stationfile ${STATIONELEVATION} --format space --coldstartdate $STARTDATE --gmtoffset 0 --timezone UTC --units si 2>> ${SYSLOG}
fi

# transpose wind velocity output file so that we can graph it with gnuplot
STATIONVELOCITY=${RUNDIR}/fort.72
if [[ -e $STATIONVELOCITY || -e ${STATIONVELOCITY}.nc ]]; then
   if [[ -e $STATIONVELOCITY.nc ]]; then
      ${OUTPUTDIR}/netcdf2adcirc.x --datafile ${STATIONVELOCITY}.nc 2>> ${SYSLOG}
   fi
   perl ${OUTPUTDIR}/station_transpose.pl --filetotranspose windvelocity --controlfile ${RUNDIR}/fort.15 --stationfile ${STATIONVELOCITY} --format space --vectorOutput raw --coldstartdate $STARTDATE --gmtoffset 0 --timezone UTC --units si 2>> ${SYSLOG}
   
   # Creating direction file
   ${OUTPUTDIR}/uvTOgeo_station.x fort.72_transpose.txt
fi

# transpose current velocity output file so that we can graph it with gnuplot
STATIONVELOCITY=${RUNDIR}/fort.62
if [[ -e $STATIONVELOCITY || -e ${STATIONVELOCITY}.nc ]]; then
   if [[ -e $STATIONVELOCITY.nc ]]; then
      ${OUTPUTDIR}/netcdf2adcirc.x --datafile ${STATIONVELOCITY}.nc 2>> ${SYSLOG}
   fi
   perl ${OUTPUTDIR}/station_transpose.pl --filetotranspose velocity --controlfile ${RUNDIR}/fort.15 --stationfile ${STATIONVELOCITY} --format space --vectorOutput raw --coldstartdate $STARTDATE --gmtoffset 0 --timezone UTC --units si 2>> ${SYSLOG}
fi

# transpose wave velocity output file so that we can graph it with gnuplot
STATIONELEVATION=${RUNDIR}/swan.61
if [[ -e $STATIONELEVATION || -e ${STATIONELEVATION}.nc ]]; then
   if [[ -e $STATIONELEVATION.nc ]]; then
      ${OUTPUTDIR}/netcdf2adcirc.x --datafile ${STATIONELEVATION}.nc 2>> ${SYSLOG}
   fi
   perl ${OUTPUTDIR}/station_transpose.pl --filetotranspose elevation --controlfile ${RUNDIR}/fort.15 --stationfile ${STATIONELEVATION} --format space --coldstartdate $STARTDATE --gmtoffset 0 --timezone UTC --units si 2>> ${SYSLOG}
fi

# switch to plots directory
initialDirectory=`pwd`;
mkdir ${RUNDIR}/plots 2>> ${SYSLOG}
mv *.txt *.csv ${RUNDIR}/plots 2>> ${SYSLOG}
cd ${RUNDIR}/plots

# generate gnuplot scripts for elevation data
ln -fs $PERL5LIB/Date ${RUNDIR}/plots/Date

# -----------------------------------------------------------------------------
#                            J P G    AND   G I F S  
# -----------------------------------------------------------------------------

if [ "$ENSTORM" = "nam" ]; then # For nam only now

   logMessage "Generating 2D contour of stage $stage for creating GIF, options: rundir=$RUNDIR outputdir=$OUTPUTDIR cycledir=$cycleDIR member=$ENSTORM config=$CONFIG Figuregen=$FIGUREGENEXECUTABLE log=$SYSLOG stage=$stage"

   # Ping to remote server to ensure it is up and running
   pingOut=`ping -c 1 $server | grep "received" | cut -d',' -f2 | cut -d' ' -f1`
   if [ ! -z "$pingOut" ]; then
      cd $mainDIR
      ${OUTPUTDIR}/POSTPROC_KMZGIS/vslztn_contour_remote.sh  $RUNDIR $OUTPUTDIR $cycleDIR $ENSTORM $CONFIG $SYSLOG $stage  &

   # If remote server is not up, use the local serevr to create 2D contours
   else
      cd $mainDIR
      FIGUREGENEXECUTABLE=FigureGen.x
      ${OUTPUTDIR}/POSTPROC_KMZGIS/vslztn_contour.sh $RUNDIR $OUTPUTDIR $cycleDIR $ENSTORM $CONFIG $FIGUREGENEXECUTABLE $SYSLOG $stage
   fi

fi
