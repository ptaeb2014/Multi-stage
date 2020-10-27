#!/bin/bash
# 
RUNDIR=$1
OUTPUTDIR=$2
cycleDIR=$3
ENSTORM=$4
CONFIG=$5
FIGUREGENEXECUTABLE=$6
SYSLOG=$7
stage=$8
#
. $CONFIG     
. ${mainDIR}/src/logging.sh
cd $RUNDIR             

# set path to the POSTPROC_KMZGIS directory
POSTPROC_DIR=$OUTPUTDIR/POSTPROC_KMZGIS

# OUTPUTPREFIX : set output filename prefix
OUTPUTPREFIX=${cycleDIR}.vis

# ######################################################################################
#                        .. JPG ..
#
JPGLOGFILE=$RUNDIR/jpg.log # log file for jpg-related info/errors
date >> $JPGLOGFILE
if [[ $FIGUREGENEXECUTABLE = "" ]]; then
   FIGUREGENEXECUTABLE=FigureGen.x
fi
# Extracting time from config to write to figure gen input files 
# Large coarse domain
year=$(echo "${CSDATE}" | cut -c1-4)
month=$(echo "${CSDATE}" | cut -c5-6)
day=$(echo "${CSDATE}" | cut -c7-8)
hour=$(echo "${CSDATE}" | cut -c9-10)
# High Res domain
CSDATE_hires=`date '+%Y%m%d' -d "$(echo ${CSDATE} | cut -c1-8)+${HINDCASTLENGTH} days"`
year_hires=$(echo "${CSDATE_hires}" | cut -c1-4)
month_hires=$(echo "${CSDATE_hires}" | cut -c5-6)
day_hires=$(echo "${CSDATE_hires}" | cut -c7-8)
hour_hires=$(echo "${CSDATE}" | cut -c9-10)
# --------------------------------------------------------------------------------------
#   2D Contour of full domain (excluding bay of Main and Fundy)
# --------------------------------------------------------------------------------------
#
#			ANIMATION
#
mkdir $RUNDIR/Temp 2>> $JPGLOGFILE
if [[ $stage -eq 1 ]]; then
   FIGUREGENTEMPLATE_elev='full-ele-wind.inp'  
   FIGUREGENTEMPLATE_wave='full-hs-dir.inp'
else
   FIGUREGENTEMPLATE_elev='irl-ele-wind.inp'
   FIGUREGENTEMPLATE_wave='irl-hs-dir.inp' 
fi

# Copying control files, Labels, and other utilites
if [[ $stage -eq 1 ]]; then
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/Elev_MS.pal                 $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/HS.pal                      $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.txt   $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.pgw   $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.png   $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/full-ele-wind.tmp           $RUNDIR/full-ele-wind.inp 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/full-hs-dir.tmp             $RUNDIR/full-hs-dir.inp   2>> $JPGLOGFILE
   # writing date/time into input files
   sed -i "s/%YEAR%/${year}/g"     $RUNDIR/full-ele-wind.inp
   sed -i "s/%MONTH%/${month}/g"   $RUNDIR/full-ele-wind.inp
   sed -i "s/%DAY%/${day}/g"       $RUNDIR/full-ele-wind.inp
   sed -i "s/%HOUR%/${hour}/g"     $RUNDIR/full-ele-wind.inp
   # writing date/time into input files
   sed -i "s/%YEAR%/${year}/g"     $RUNDIR/full-hs-dir.inp
   sed -i "s/%MONTH%/${month}/g"   $RUNDIR/full-hs-dir.inp
   sed -i "s/%DAY%/${day}/g"       $RUNDIR/full-hs-dir.inp
   sed -i "s/%HOUR%/${hour}/g"     $RUNDIR/full-hs-dir.inp
else
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-ele-wind.tmp            $RUNDIR/irl-ele-wind.inp 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-hs-dir.tmp              $RUNDIR/irl-hs-dir.inp   2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/Elev_MS.pal                 $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/HS.pal                      $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-background.txt          $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-background.pgw          $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-background.png          $RUNDIR 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-labels.txt              $RUNDIR 2>> $JPGLOGFILE
   # writing date/time into input files
   sed -i "s/%YEAR%/${year_hires}/g"     $RUNDIR/irl-ele-wind.inp
   sed -i "s/%MONTH%/${month_hires}/g"   $RUNDIR/irl-ele-wind.inp
   sed -i "s/%DAY%/${day_hires}/g"       $RUNDIR/irl-ele-wind.inp
   sed -i "s/%HOUR%/${hour_hires}/g"     $RUNDIR/irl-ele-wind.inp
   # writing date/time into input files
   sed -i "s/%YEAR%/${year_hires}/g"     $RUNDIR/irl-hs-dir.inp
   sed -i "s/%MONTH%/${month_hires}/g"   $RUNDIR/irl-hs-dir.inp
   sed -i "s/%DAY%/${day_hires}/g"       $RUNDIR/irl-hs-dir.inp
   sed -i "s/%HOUR%/${hour_hires}/g"     $RUNDIR/irl-hs-dir.inp
fi

# Redirect to run directory
cd $RUNDIR

# Logging
logMessage "Generating 2D GIF contour for predicted surface elevation"

# Running the FigureGen for elevation and wind
mpirun -np $NCPU $POSTPROC_DIR/FigGen/${FIGUREGENEXECUTABLE} -I ${FIGUREGENTEMPLATE_elev} >> $JPGLOGFILE 2>&1 

# Running the FigureGen for elevation and wind
mpirun -np $NCPU $POSTPROC_DIR/FigGen/${FIGUREGENEXECUTABLE} -I ${FIGUREGENTEMPLATE_wave} >> $JPGLOGFILE 2>&1

date >> $JPGLOGFILE
if [[ $stage -eq 1 ]]; then
   convert -delay 18 FullElevWin*.jpg -loop 0 full_elev_wind.gif  
   convert -delay 18 FullHsDir*.jpg   -loop 0 full_hs_dir.gif     
else
   convert -delay 18 IRLElevWin*.jpg -loop 0 irl_elev_wind.gif    
   convert -delay 18 IRLHsDir*.jpg   -loop 0 irl_hs_dir.gif       
fi

# Cleaning
rm -rf Temp 2>> $JPGLOGFILE
rm *.jpg
# rm *.inp 
#
#
