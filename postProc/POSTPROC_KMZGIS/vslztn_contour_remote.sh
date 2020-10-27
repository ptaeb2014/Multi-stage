#!/bin/bash
# 
RUNDIR=$1
OUTPUTDIR=$2
cycleDIR=$3
ENSTORM=$4
CONFIG=$5
SYSLOG=$6
stage=$7
#
. $CONFIG     
. ${mainDIR}/src/logging.sh

cd $RUNDIR             

# Set the Path to Figuregen executable
POSTPROC_DIR=$OUTPUTDIR/POSTPROC_KMZGIS
OUTPUTPREFIX=${cycleDIR}.vis
JPGLOGFILE=$remote/jpg.log
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
# ------------------------------------------------------------------------
#   2D Contour of full domain (excluding bay of Main and Fundy)
# ------------------------------------------------------------------------
#
#			ANIMATION
#
if [[ $stage -eq 1 ]]; then
   FIGUREGENTEMPLATE_elev='full-ele-wind.inp'  
   FIGUREGENTEMPLATE_wave='full-hs-dir.inp'
else
   FIGUREGENTEMPLATE_elev='irl-ele-wind.inp'
   FIGUREGENTEMPLATE_wave='irl-hs-dir.inp' 
fi

# Copying control files, Labels, and other utilites
if [[ $stage -eq 1 ]]; then
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-ele-wind.tmp            $RUNDIR/irl-ele-wind.inp 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-hs-dir.tmp              $RUNDIR/irl-hs-dir.inp   2>> $JPGLOGFILE
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
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/Elev_MS.pal                 $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/HS.pal                      $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.txt   $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.pgw   $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.png   $server:$remote 
   scp $RUNDIR/full-ele-wind.inp                                          $server:$remote 
   scp $RUNDIR/full-hs-dir.inp                                            $server:$remote 
   scp $RUNDIR/fort.63                                                    $server:$remote 
   scp $RUNDIR/fort.14                                                    $server:$remote 
   scp $RUNDIR/fort.74                                                    $server:$remote
   scp $RUNDIR/swan_HS.63                                                 $server:$remote
   scp $RUNDIR/swan_DIR.63                                                $server:$remote 
else
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-ele-wind.tmp            $RUNDIR/irl-ele-wind.inp 2>> $JPGLOGFILE
   cp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-hs-dir.tmp              $RUNDIR/irl-hs-dir.inp   2>> $JPGLOGFILE
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
   scp $RUNDIR/irl-ele-wind.inp                                           $server:$remote
   scp $RUNDIR/irl-hs-dir.inp                                             $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/Elev_MS.pal                 $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/HS.pal                      $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-background.txt          $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-background.pgw          $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-background.png          $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-labels.txt              $server:$remote 
   scp $RUNDIR/fort.63                                                    $server:$remote
   scp $RUNDIR/fort.14                                                    $server:$remote
   scp $RUNDIR/fort.74                                                    $server:$remote
   scp $RUNDIR/swan_HS.63                                                 $server:$remote 
   scp $RUNDIR/fort.14                                                    $server:$remote 
   scp $RUNDIR/swan_DIR.63                                                $server:$remote 
fi

# Copying 
# Logging
logMessage "Generating 2D GIF contour for predicted surface elevation"

ssh $server sh -c "

mkdir $remote/Temp 

cd $remote

mpirun -np $NCPUremote ${FIGUREGENEXECUTABLEremote} -I ${FIGUREGENTEMPLATE_elev} 
mpirun -np $NCPUremote ${FIGUREGENEXECUTABLEremote} -I ${FIGUREGENTEMPLATE_wave}

date >> $JPGLOGFILE

if [[ $stage -eq 1 ]]; then
   convert -delay 18 FullElevWin*.jpg -loop 0 full_elev_wind.gif  
   convert -delay 18 FullHsDir*.jpg   -loop 0 full_hs_dir.gif     

   scp full_elev_wind.gif $localserver:$RUNDIR
   scp full_hs_dir.gif    $localserver:$RUNDIR
else
   convert -delay 18 IRLElevWin*.jpg -loop 0 irl_elev_wind.gif    
   convert -delay 18 IRLHsDir*.jpg   -loop 0 irl_hs_dir.gif       

   scp irl_elev_wind.gif $localserver:$RUNDIR 
   scp irl_hs_dir.gif   $localserver:$RUNDIR
fi

rm -rf  *

echo $cycleDIR > Forecast-cycle
echo $stage >> Forecast-cycle

cd -"
