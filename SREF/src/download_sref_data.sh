#!/bin/bash
#
#########################################################
#
#                S U B    R O U T I N E
#
# Downloading SREF NMM (nmb) data
downloadSREF(){

    # Getting options
    ens=$1
    model=$2 
    fcst_hour=$3
    src=$4
    tmp=$5
    current_run=$6

    # Setting the URL
    url_con='http://www.ftp.ncep.noaa.gov/data/nccf/com/sref/prod/sref.'
    url_var=$today_date'/'$current_run'/pgrb/sref_'$model'.t'$current_run'z.pgrb132.'$ens'.f'$fcst_hour.grib2
    url=$url_con$url_var
    echo $url    
 
    # Creating folders for placing data
    mkdir $tmp/$ens'_'$model
    filename='sref_'$model'.t'$current_run'z.'$ens'.f'$fcst_hour.grib2
    wget $url -O $tmp/$ens'_'$model/$filename
}
# ================== E N D   O F   S U B R O U T I N E S ==================
# Options
CONFIG=$1
. ${CONFIG}

tmp=`pwd`/tmp/
src=`pwd`/src/
UVP=`pwd`/UVP/

# Creating tmp/src/UVP
mkdir ${tmp}
mkdir ${src}
mkdir ${UVP}

# Defining ensemble names
ensemble=()
ensemble+=( ctl p1 p2 p3 p4 p5 p6 )                                            
ensemble+=(     n1 n2 n3 n4 n5 n6 )                        
lenE=${#ensemble[@]}

# To get the index
today_date=`date '+%Y%m%d'`
#today_date="20181025"

# removing previous index.htms
rm index.html*

# Getting the index.html
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/sref/prod/sref.$today_date/

# Getting the existing cycles using a combination
# of text processing commands
cat index.html | grep -a "href" | cut -d'"' -f2 | sed '1d' > current.cycles

# Checking with NAM cycle, we want to download a correponding cycle of SREF to NAM
NAM_current=`cat $mainDIR/$ID/currentCycle`
today_date=`echo $NAM_current | cut -c 1-8`
NAM_cycle=`echo $NAM_current | cut -c 9-10`

# SREF latest cycle from index
SREF_cycle=$(cat current.cycles | tail -1 |  cut -d'<' -f2 |  cut -d' ' -f2 | cut -d'/' -f1)

# Defining forecast hours
# Starting from 03 of one cycle issued before the latest cycle 
# issued by NAM and GEFS. SREF is issued 03 hour later than these two
fcst_hou=()
fcst_hou+=( 03 06 09 12 15 18 21 24 27 30 33)
fcst_hou+=( 36 39 42 45 48 51 54 57 60 63)
fcst_hou+=( 66 69 72 75 78 81 84 87 )
lenF=${#fcst_hou[@]}

# if NAM 00 available & SREF 21 of yesterday available
if [ "$NAM_cycle" = "00" ]; then
   today_date=`date -d "$today_date 1 day ago" '+%Y%m%d'`
   SREF_cycle=21
elif [ "$NAM_cycle" = "06" ]; then
     SREF_cycle=03
elif [ "$NAM_cycle" = "12" ]; then
     SREF_cycle=09
elif [ "$NAM_cycle" = "18" ]; then
     SREF_cycle=15
fi

# Get rid of old files
rm -rf $tmp/*

# Setting up download arguement
for (( hr=0; hr<${lenF}; hr++ )) ;
do
  for en in {0..12}   
  do 
     downloadSREF ${ensemble[$en]} nmb ${fcst_hou[$hr]} $src $tmp $SREF_cycle &
  done
done

# Wait until all running jobs finish
wait $(jobs -rp)

# Logging
echo "SREF files downloaded from SREF cycle: $today_date $SREF_cycle, NAM cycle is: $NAM_current" >> logfile

# STARTING PROCESSING
# Defining wind and press for genfort.x options
press_options=()
wind_options=()

for dir in $(ls $tmp )
do
  # Redirect to each member file
  cd $tmp/$dir/

  # Linking 
  ln -fs $mainDIR/NAM/NAMtoOWI.pl
  ln -fs $mainDIR/input/ptFile.txt
  ln -fs $mainDIR/utility/PERL/Date
  ln -fs $mainDIR/utility/PERL/ArraySub.pm

  ./NAMtoOWI.pl --ptFile ptFile.txt --namFormat grib2 --namType $dir --awipGridNumber 132 --dataDir $tmp/$dir/ --outDir $tmp/$dir/ --velocityMultiplier 1 --scriptDir $mainDIR --member sref  
done

# Get back to working dir
cd $mainDIR/SREF

# Wait until all running jobs finish
wait $(jobs -rp)

# Go through all members and add created NAM files as input for the fortran code
for dir in $(ls $tmp )
do
   cd $tmp/$dir/
   # Add the generated files to the ./genforts.x options
   press=`pwd`/`ls *.221`
   wind=`pwd`/`ls *.222`

   # Add the path to the beginning
   press_options+=($press)
   wind_options+=($wind)
done

# The fortran code reads press first, and then winds
options="${press_options[*]} ${wind_options[*]}"

# Get back to working dir
cd $mainDIR/SREF

# Linkign the forts generating fortran code
ln -fs $mainDIR/SREF/src/genforts.x $mainDIR/SREF/UVP/genforts.x

# Redirect to the UVP where new fort.221/2 will be created 
cd UVP/

# Removing previous files (fortran write status is new)
rm sref_*

echo "Options for reading and processing nmb files are:"
echo "${options[*]}"
 ./genforts.x ${options[*]}

# Get back to working dir
cd $mainDIR/SREF

# Cleaning tmp
rm -rf $tmp/*
