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
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/Elev_MS.pal                 $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/HS.pal                      $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.txt   $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.pgw   $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/fulldomain_background.png   $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/full-ele-wind.inp           $server:$remote 
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/full-hs-dir.inp             $server:$remote 
   scp $RUNDIR/fort.63                                                    $server:$remote 
   scp $RUNDIR/fort.14                                                    $server:$remote 
   scp $RUNDIR/fort.74                                                    $server:$remote
   scp $RUNDIR/swan_HS.63                                                 $server:$remote
   scp $RUNDIR/swan_DIR.63                                                $server:$remote 
else
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-ele-wind.inp            $server:$remote
   scp $OUTPUTDIR/POSTPROC_KMZGIS/FigGen/GIFs/irl-hs-dir.inp              $server:$remote 
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
