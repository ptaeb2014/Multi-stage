#!/bin/bash
#
# Author:
#       Peyman Taeb 
#       October 2018
#
# As a component of Multistage-NAM-GEFS
#
# -----------------------------------------------------------------------
 
# Reading options
cycleDir=$1
main=$2
CONFIG=$3
SYSLOG=$4

# Calling loggins.sh
. ${CONFIG}
. $main/src/logging.sh
logMessage "Starting creating validation plots for state 2"

# Defining the path to the current cycle run
workDir=`pwd`/$cycleDir/
mkdir $workDir/validation_s2

# Defining the old cycle run before redirecting to the current cycle dir.
cycleDir_date="$(echo $cycleDir | cut -c1-8)"
cycleDir_time="$(echo $cycleDir | cut -c9-10)"

old_pred_date=`date +'%Y%m%d' -d "$cycleDir_date 2 days ago"`
old_pred="$old_pred_date$cycleDir_time"

# In case of missing the 2 days ago cycle, pick another cycle from 2 days ago
if [ ! -d $mainDIR/$ID/${old_pred} ]; then
   old_pred=`ls $mainDIR/$ID | grep $old_pred_date | head -1`
fi

logMessage "Appending prediction of cycle $old_pred"
old_pred_path=`pwd`/$old_pred

# Redirecting to current cycle dir
cd $workDir/validation_s2

# Linking fort.61_transpose.txt files from ensemble runs
# First, checking the existance. If an ensemble has not been
# set to performed, or crashed, the validation plot should
# be still created by using other runs' results.
# NAM
# Array of station outputs
st_out=( fort.61 swan.61 )
lenST=${#st_out[@]}

memb=()
for (( i=0; i<${lenST}; i++ )) ;
do
   # NAM
   ln -fs $workDir/nam/S2/plots/${st_out[$i]}_transpose.txt           ${st_out[$i]}_nam
   memb+=( nam )

   # GEFS mean
   ln -fs $workDir/GEFSmean/S2/plots/${st_out[$i]}_transpose.txt      ${st_out[$i]}_GEFSmean
   memb+=( GEFSmean)

   # GEFS meanPstd
   ln -fs $workDir/GEFSmeanPstd/S2/plots/${st_out[$i]}_transpose.txt  ${st_out[$i]}_GEFSmeanPstd
   memb+=( GEFSmeanPstd )

   # GEFS meanMstd
   ln -fs $workDir/GEFSmeanMstd/S2/plots/${st_out[$i]}_transpose.txt  ${st_out[$i]}_GEFSmeanMstd
   memb+=( GEFSmeanMstd )

   # GEFS SREFmean
   ln -fs $workDir/SREFmean/S2/plots/${st_out[$i]}_transpose.txt      ${st_out[$i]}_SREFmean
   memb+=( SREFmean)

   # GEFS SREFmeanPstd
   ln -fs $workDir/SREFmeanPstd/S2/plots/${st_out[$i]}_transpose.txt  ${st_out[$i]}_SREFmeanPstd
   memb+=( SREFmeanPstd )

   # GEFS SREFmeanMstd
   ln -fs $workDir/SREFmeanMstd/S2/plots/${st_out[$i]}_transpose.txt  ${st_out[$i]}_SREFmeanMstd
   memb+=( SREFmeanMstd )
done

# Get rid of 0 & 1 column in swan.61_ files
sed -i  's/ 0 //g' swan.61_*  
sed -i  's/ 1 //g' swan.61_*

# Paste them into one
lenM=${#memb[@]}

#
j=0
echo "Info: Pasting member ${memb[0]}"
cp fort.61_${memb[0]} single_fort61_$j
cp swan.61_${memb[0]} single_swan61_$j

for (( i=1; i<${lenM}; i++ )) ;
   do
   logMessage "Pasting member ${memb[$i]}"
   paste single_fort61_$j     fort.61_${memb[$i]} >   single_fort61_$i
   paste single_swan61_$j     swan.61_${memb[$i]} >   single_swan61_$i
   # Cleaning
   rm single_fort61_$j
   rm single_swan61_$j
   #
   j=`expr "$j" + 1`
   done

logMessage "Single_fort61 has been generated"
i=`expr "$i" - 1`
mv single_fort61_$i single_fort61
mv single_swan61_$i     single_swan61

# Getting the prediction from 2 days ago
# Copying 
cp $old_pred_path/validation_s2/single_fort61 single_fort61_$old_pred
cp $old_pred_path/validation_s2/single_swan61 single_swan61_$old_pred

# WL: Find the start time of the current cycle and 
date_cut=`head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f1`
time_cut=`head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f2`
datetime_cut="$date_cut $time_cut"

# WL: Delete the lines from old run that overlap the current run
line_cut=`grep "${datetime_cut}" single_fort61_$old_pred`
sed "/${line_cut}/,\$d" single_fort61_$old_pred > single_fort61_old

# HS: Find the start time of the current cycle (different output time step)
date_cut=`head -3 swan.61_${memb[0]} | tail -1 | cut -d' ' -f1`
time_cut=`head -3 swan.61_${memb[0]} | tail -1 | cut -d' ' -f2`
datetime_cut="$date_cut $time_cut"

# HS: Delete the lines from old run that overlap the current run
line_cut=`grep "${datetime_cut}" single_swan61_$old_pred`
sed "/${line_cut}/,\$d" single_swan61_$old_pred > single_swan61_old

# Creating gnuplot input files form the template
cp  $mainDIR/utility/make_GPtemplate.sh      $workDir/validation_s2/
cp  ${gnutemplate}                           $workDir/validation_s2/template.gp
cp  ${s2_INPDIR}/${s2_ELEVgnuplot}           $workDir/validation_s2/
./make_GPtemplate.sh 7 template.gp  ${s2_ELEVgnuplot}   

# -------------------------------------------------------------------
#       U S G S   O B S E R V A T I O N A L    P L O T S
#
# Downloading USGS data
# Linking 
ln -fs $main/postProc/USGS/usgs-WL-download.sh
ln -fs $main/postProc/USGS/usgs_wl_process.x

./usgs-WL-download.sh   haulovercanal  single_fort61_old $CONFIG
./usgs-WL-download.sh   wabasso        single_fort61_old $CONFIG

# Finding max and min of observaion for the use in yrange of gnuplot
max=`cat WL-haulovercanal-USGS | cut -d' ' -f4 | sort -n | head -1`
min=`cat WL-haulovercanal-USGS | cut -d' ' -f4 | sort -n | tail -1`

margin_min=`echo "$min" / 10 | bc -l`
echo "$min" - "$margin_min" | bc -l > x-hc-line

margin_max=`echo "$max" / 10 | bc -l`
echo "$max" + "$margin_max" | bc -l >> x-hc-line

max=`cat WL-wabasso-USGS | cut -d' ' -f4 | sort -n | head -1`
min=`cat WL-wabasso-USGS | cut -d' ' -f4 | sort -n | tail -1`

margin_min=`echo "$min" / 10 | bc -l`
echo "$min" - "$margin_min" | bc -l > x-wabasso-line

margin_max=`echo "$max" / 10 | bc -l`
echo "$max" + "$margin_max" | bc -l >> x-wabasso-line

# Creating the line illustrating the cycle start time
# Date
head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f1 >  dateline
head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f1 >> dateline

#Time
head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f2 >  timeline
head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f2 >> timeline

#Zone
head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f3 >  zoneline
head -3 fort.61_${memb[0]} | tail -1 | cut -d' ' -f3 >> zoneline

# Creating the line file
paste -d" " dateline timeline zoneline x-hc-line      > line-hc
paste -d" " dateline timeline zoneline x-wabasso-line > line-wa

# Cleaning
rm dateline timeline zoneline x-hc-line x-wabasso-line

# Writing Cycle number to gnuplot template
sed -i 's/%cycle%/'$cycleDir'/g'       gnuplot_HauloverCanal.gp
sed -i 's/%oldcycle%/'$old_pred'/g'    gnuplot_HauloverCanal.gp
sed -i 's/%cycle%/'$cycleDir'/g'       gnuplot_Wabasso.gp
sed -i 's/%oldcycle%/'$old_pred'/g'    gnuplot_Wabasso.gp 

# Creating plots
gnuplot gnuplot_HauloverCanal.gp
gnuplot gnuplot_Wabasso.gp 

# Converting - Creating in 200 dpi. PS files are stored and can
# be converted to higher quality JPG or other formats. 
convert -rotate 90 -density 200 HauloverCanal.ps  WLHaulover.jpg 
convert -rotate 90 -density 200 Wabasso.ps        WLWabasso.jpg

# A little more cleaning
# We keep the rest for troubleshooting purposes. The remaining files
# along with other folder and files of this cyclewill be deteleted
# by postManaging.sh 5 days later
rm fort* swan* 

# -------------------------------------------------------------------
#          N O N   O B S E R V A T I O N A L    S T A T I O N S
#                            WATER LEVEL 
#
ls gnuplot_* > listGNUplot
file="listGNUplot"

# Removing Wabasso and Haulover canal's from list
sed -i '/gnuplot_HauloverCanal.gp/d' listGNUplot
sed -i '/gnuplot_Wabasso.gp/d'       listGNUplot

while IFS= read -r gnuinput
do
  sed -i 's/%cycle%/'$cycleDir'/g' $gnuinput
  gnuplot $gnuinput

  # Get the name
  plotnamePS=`echo $gnuinput | cut -d'_' -f2 | sed 's/gp/ps/'`
  plotnameJPG=`echo $gnuinput | cut -d'_' -f2 | sed 's/gp/jpg/'`
  plotnameJPG="WL"${plotnameJPG}
  convert -rotate 90 -density 200 $plotnamePS $plotnameJPG

done < "$file"

# Deleting 
rm gnuplot_*
rm listGNUplot 
# -------------------------------------------------------------------
#          N O N   O B S E R V A T I O N A L    S T A T I O N S
#                               HS

# Creating gnuplot input files form the template
cp   $mainDIR/utility/make_GPtemplate.sh     $workDir/validation_s2/
cp   ${gnutemplate}                          $workDir/validation_s2/template.gp
cp   ${s2_INPDIR}/${s2_WAVEgnuplot}          $workDir/validation_s2/
./make_GPtemplate.sh 7 template.gp  ${s2_WAVEgnuplot}                  

ls gnuplot_* > listGNUplot
file="listGNUplot"

while IFS= read -r gnuinput
do
  sed -i 's/%cycle%/'$cycleDir'/g' $gnuinput
  gnuplot $gnuinput

  # Get the name
  plotnamePS=`echo $gnuinput | cut -d'_' -f2 | sed 's/gp/ps/'`
  plotnameJPG=`echo $gnuinput | cut -d'_' -f2 | sed 's/gp/jpg/'`
  plotnameJPG="HS"${plotnameJPG}
  convert -rotate 90 -density 200 $plotnamePS $plotnameJPG

done < "$file"
