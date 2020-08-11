#!/bin/bash
#
# (Creating time series plots and) sending notifying emails
# ----------------------------------------------------------

# Getting options
SYSLOG=$1
CONFIG=$2
PHASE=$3
RUNDIR=$4
cycleDIR=$5
ENSTORM=$6
startRun=$7
endRun=$8

. $CONFIG
. ${mainDIR}/src/logging.sh
workingDIR=$mainDIR$ID

if [[ $PHASE = results ]]; then

   # Creating validation plots
   logMessage "Starting downloading and creating NOAA validation water level plots."
   ln -fs $mainDIR/postProc/validation_driver/genValidationPlots-s1.sh $workingDIR/genValidationPlots-s1.sh
   cd $workingDIR
   ./genValidationPlots-s1.sh $cycleDIR $mainDIR $CONFIG $SYSLOG 
   cd -

   logMessage "Starting downloading and creating USGS validation water level plots."
   ln -fs $mainDIR/postProc/validation_driver/genValidationPlots-s2.sh $workingDIR/genValidationPlots-s2.sh
   cd $workingDIR 
   ./genValidationPlots-s2.sh $cycleDIR $mainDIR $CONFIG $SYSLOG
   cd -

   # Post processing such as file archiving, freeing up space, etc
   logMessage "Starting archving, freeing up space ..."
   $mainDIR/postProc/postManaging.sh  $SYSLOG $CONFIG $cycleDIR

   # Sending notification
   cd ${mainDIR}/postProc/
   ln -s $mainDIR/utility/PERL/Date            $mainDIR/postProc/     2>> ${SYSLOG} 
   ln -s $mainDIR/utility/PERL/ArraySub.pm     $mainDIR/postProc/     2>> ${SYSLOG}
   #
   logMessage "Caluclating runtime and preparing notification text and email with following options: ./wallClock.pl --st $startRun --et $endRun --not ${mainDIR}/postProc/notification --dir $RUNDIR"
   perl ${mainDIR}/postProc/wallClock.pl --st $startRun --et $endRun --not ${mainDIR}/postProc/notification --dir $RUNDIR >> ${SYSLOG} 2>&1
   chmod +x ${RUNDIR}/notifying.sh
   ${RUNDIR}/notifying.sh $cycleDIR $CONFIG $SYSLOG $PHASE $RUNDIR  
   cd ${mainDIR}/

elif [[ $PHASE = newcycle ]]; then
   
   # Notifying 
   cp ${mainDIR}/postProc/notification $RUNDIR/notifying.sh
   chmod +x ${RUNDIR}/notifying.sh
   ${RUNDIR}/notifying.sh $cycleDIR $CONFIG $SYSLOG $PHASE $RUNDIR
   cd ${mainDIR}/

fi

# Logging
logMessage "$notify_list notified of $PHASE"
