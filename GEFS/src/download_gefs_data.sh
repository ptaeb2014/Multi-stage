#!/bin/bash
#
# Downloading gefs data using get_inv.pl and get_grib.pl
config=$1
. ${config}

#########################################################
#
#                S U B    R O U T I N E
#
# Downloading GEFS data
downloadGEFS(){
    # Getting options
    ens=$1
    fcst_hour=$2
    src=$3
    tmp=$4
    current_run=$5

    #
    # Setting the URL
    url_con='https://www.ftp.ncep.noaa.gov/data/nccf/com/gens/prod/gefs.'
    url_var=$today_date'/'$current_run'/pgrb2ap5/'$ens'.t'$current_run'z.pgrb2a.0p50.f'$fcst_hour
    url=$url_con$url_var

    # 
    # Downloading
    perl $src/get_inv.pl $url.idx | egrep "(10 m above|PRES:surface)" | perl $src/get_grib.pl $url  $ens'.t'$current_run_$fcst_hour.grib2 >> logfile
	       
    # 
    # Moving the output to data dir
    mv $ens'.t'$current_run_$fcst_hour.grib2  $tmp
}
# ================== E N D   O F   S U B R O U T I N E S ==================
# Syntax: src/download  [domain: IRL/ec_large]
echo "Syntax: src/download  config"

tmp=`pwd`/tmp/
src=`pwd`/src/

# Creating tmp 
mkdir ${tmp}
mkdir `pwd`/uv_ec_large
mkdir `pwd`/uv_IRL

# Defining ensemble names
ensemble=()
ensemble+=( gec00 gep01 gep02 gep03 gep04 gep05 gep06 )
ensemble+=( gep07 gep08 gep09 gep10 gep11 gep12 gep13 )
ensemble+=( gep14 gep15 gep16 gep17 gep18 gep19 gep20 )
lenE=${#ensemble[@]}

# removing previous index.htms
rm index.html*

# To get the index
today_date=`date '+%Y%m%d'` 

# Getting the index.html
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gens/prod/gefs.$today_date/

# Getting the existing cycles using a combination
# of text processing commands
cat index.html | grep -a "href" | cut -d'"' -f2 | sed '1d' > current.cycles

# Checking with NAM cycle, we want to download a correponding cycle of GEFS to NAM
NAM_current=`cat $mainDIR/$ID/currentCycle`
today_date=`echo $NAM_current | cut -c 1-8`
NAM_cycle=`echo $NAM_current | cut -c 9-10`

# GEFS latest cycle from index
GEFS_cycle=$(cat current.cycles | tail -1 |  cut -d'<' -f2 |  cut -d' ' -f2 | cut -d'/' -f1)

# Specify today or yesterday cycle of GEFS. today cycle if one has been issued.
if [ $NAM_cycle = $GEFS_cycle ]; then
   
   # Defining forecast hours
   fcst_hou=()
   fcst_hou+=( 000 003 006 009 012 015 018 021 024 027 )
   fcst_hou+=( 030 033 036 039 042 045 048 051 054 057 )
   fcst_hou+=( 060 063 066 069 072 075 078 081 084)
   lenF=${#fcst_hou[@]}
   # GEFS_cycle=$GEFS_cycle ! sure !
else
 
   # If latest GEFS not catch up latest NAM, forecast hours:
   # Defining forecast hours
   fcst_hou=()
   fcst_hou+=( 006 009 012 015 018 021 024 027 030 033 )
   fcst_hou+=( 036 039 042 045 048 051 054 057 060 063 )
   fcst_hou+=( 066 069 072 075 078 081 084 087 090)
   lenF=${#fcst_hou[@]}

   # if NAM 00 available & GEFS 18 of yesterday available
   if [ "$NAM_cycle" = "00" ]; then
      today_date=`date -d "$today_date 1 day ago" '+%Y%m%d'`
      GEFS_cycle=18
   elif [ "$NAM_cycle" = "06" ]; then
      GEFS_cycle=00
   elif [ "$NAM_cycle" = "12" ]; then
      GEFS_cycle=06
   elif [ "$NAM_cycle" = "18" ]; then
      GEFS_cycle=12
   fi
fi

# Setting up download arguement
for (( hr=0; hr<${lenF}; hr++ )) ;
do
    for en in {0..20}
    do
        downloadGEFS ${ensemble[$en]} ${fcst_hou[$hr]} $src $tmp $GEFS_cycle &
    done 
done

# Wait until all running jobs finish
wait $(jobs -rp)

# Logging 
echo " GEFS file downloaded from GEFS cycle: $today_date $GEFS_cycle, NAM cycle is: $NAM_current" >> logfile

# Processing data by calling process_gefs.sh
$src/process_gefs.sh IRL      "${fcst_hou[@]}"  & PIDIOS=$!
$src/process_gefs.sh ec_large "${fcst_hou[@]}"  & PIDMIX=$!

# Move foreward when the one that takes longer finishes up
wait $PIDIOS
wait $PIDMIX

# cleaning
rm $uv*/u*
rm $uv*/v*
rm $uv*/pre*
# rm $uv*/genOWI.x
rm $uv*/fort.9*
rm $tmp/*
