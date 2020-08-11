#!/bin/bash
#
# Author
# Peyman Taeb Sep 2018
#
# Program description:
# Downloading data from USGS national water information system
#
# Supports: Water level 
#
# Usage:
# usgs-WL-download.sh <site name> <a fort.61 from 4 ensemble>                    
#
# ------------------------------------------------------------------------
# Options
site_name=$1
fort_61=$2
config=$3

# 
. ${config}

# For readibility
echo ""

# Station disctionary
if [[ $site_name = wabasso ]]; then
   site_no=02251800
elif [[ $site_name = haulovercanal ]]; then
   site_no=02248380
fi

# Info
echo "Info: Wrking on station $site_name ... "
   
# Getting year, month, day, hour, and minute of the current run
st_y=`cat $fort_61   | head -3 | tail -1 | cut -d' ' -f1 | cut -d'-' -f1`
st_m=`cat $fort_61   | head -3 | tail -1 | cut -d' ' -f1 | cut -d'-' -f2`
st_d=`cat $fort_61   | head -3 | tail -1 | cut -d' ' -f1 | cut -d'-' -f3 | cut -d',' -f1`
st_h=`cat $fort_61   | head -3 | tail -1 | cut -d' ' -f2 | cut -d':' -f1`                                
st_mm=`cat $fort_61   | head -3 | tail -1 | cut -d' ' -f2 | cut -d':' -f2`                               
echo "Info: Model-predicted water level starts at $st_h:$st_mm UTC on $st_m/$st_d/$st_y"

en_y=`cat $fort_61   | tail -1 | cut -d' ' -f1 | cut -d'-' -f1`
en_m=`cat $fort_61   | tail -1 | cut -d' ' -f1 | cut -d'-' -f2`
en_d=`cat $fort_61   | tail -1 | cut -d' ' -f1 | cut -d'-' -f3 | cut -d',' -f1`
en_h=`cat $fort_61   | tail -1 | cut -d' ' -f2 | cut -d'-' -f3 | cut -d',' -f2 | cut -d':' -f1`
en_mm=`cat $fort_61  | tail -1 | cut -d' ' -f2 | cut -d'-' -f3 | cut -d',' -f2 | cut -d':' -f2`
echo "Info: Model-predicted water level ends at   $en_h:$en_mm UTC on $en_m/$en_d/$en_y"

# Downloading some data to identify the time zone
begin_date_TZ=`date +%Y-%m-%d --date="$st_y-$st_m-$st_d"`
end_date_TZ=`date +%Y-%m-%d --date="$en_y-$en_m-$en_d"`
echo "Info: Downloading date from $begin_date_TZ to $end_date_TZ just to get the time zone"

# Initial download to find out the time zone
url="https://waterdata.usgs.gov/nwis/uv?cb_00065=on&format=rdb&site_no=$site_no&period=&begin_date=$begin_date_TZ&end_date=$end_date_TZ" 
wget $url -O raw-observed-$site-initial > /dev/null 2>&1

# Finding out the time zone of USGS data (EDT/EST)
identify_timezone=`tail -10 raw-observed-${site_name}-initial | grep "EDT"`
if [[ ! -z $identify_timezone ]]; then
   echo "Info: Time zone is EDT in USGS data: GMT-4"
   time_zone="EDT"
   offset=4
else
   echo "Info: Time zone is EST in USGS data: GMT-5"  
   time_zone="EST"
   # offset="5"  ! Not seem right
   offset=5
fi

# Download date not contain hour and min (not supported in the USGS website)
begin_date_plot=`date '+%Y-%m-%d %H:%M' --date="$begin_date_TZ "`
begin_date_download=`date '+%Y-%m-%d' --date="$begin_date_plot"`

# OBSERVATION END DATE IS NOW DATE
end_date_plot=`date '+%Y-%m-%d %H:%M'`
end_date_download=`date '+%Y-%m-%d'`

echo "Info: Observed data will be downloaded from the beginning of the validation cycle"
echo "      and ending some hours after the start time of the cycle:"
echo "      $begin_date_plot $time_zone  TO  $end_date_plot $time_zone"

# Downloading USGS data starting from 2 days before the start time of the current cycle
datum=63160 # NAVD88
url="https://waterdata.usgs.gov/nwis/uv?cb_$datum=on&format=rdb&site_no=$site_no&period=&begin_date=$begin_date_download&end_date=$end_date_download" 
wget $url -O raw-observed-${site_name} 

# Trimming the observed starting from time 2 day ago
# First, deleting the metadata from the head of the file
# Second, There are two header following the meta data
# tail -n +3 deletes these two line.
sed -e '/#/d' raw-observed-${site_name}  | tail -n +3 > trimmed-observed-${site_name}

# Cleaning
rm raw-observed-${site_name}-initial
rm raw-observed-${site_name}
mv raw-observed-${site_name}-trim-tail  trimmed-observed-${site_name}

# Calling the fortran code to process data (calculating mean and applying sshag)
# Syntax
#       ./usgs_wl_process.x <trimmed file name > sshag

# Update March 2019: No adjustment for SSHAG. Results are in NAVD88, obs downloaded in NAVD88 from now on
# Update2 March 2019: There is offset of SSHAG order. It seems that the stations do not include the 
# low-frequency variations!
sshag=`cat $mainDIR/utility/SSHAG/SSHAG`
./usgs_wl_process.x trimmed-observed-${site_name} $sshag
echo "Info: Processed water level data created (fort.71)"

# Greping the end time of the downloaded data which is the time of
# the moment the plot is being generated. 
end_date=`tail -1 'trimmed-observed'-${site_name} | awk '{print $3}'`
echo "end_date of trimmed data in EDT: $end_date"
end_time=`tail -1 'trimmed-observed'-${site_name} | awk '{print $4}'`
echo "end_time of trimmed data in EDT: $end_time"
end_EDT="$end_date $end_time"
s=$end_EDT

# Applying the time zone offse
end_UTC=`timeout 5 date -d "${s:0:10} ${s:11:2} +$offset hour" '+%Y-%m-%d %H:%M'`

# Getting the length of trimmed file
len=`wc -l 'trimmed-observed'-${site_name} | cut -d' ' -f1`

# I can't make +15 minutes work, so I create date/time in reverese order (last day to first day)
# and then re-order them later
# Creating reversed order of date and time in UTC for observed USGS
for (( i=0; i<${len}; i++ )) ;
do
   DATETIME=`date '+%Y-%m-%d %H:%M' --date="$end_UTC 15 minutes ago"`
   echo "$DATETIME:00 UTC" >>  DateTimeColumn_usgs_observed_UTC_${site_name}
   end_UTC=$DATETIME
done
echo "Info: Date and time column created in UTC for observations"

# Re-order the date time 
sort  DateTimeColumn_usgs_observed_UTC_${site_name} > DateTimeColumn_usgs_observed_UTC_srtd_${site_name}

# Cleaning
rm DateTimeColumn_usgs_observed_UTC_${site_name}
mv DateTimeColumn_usgs_observed_UTC_srtd_${site_name}  DateTimeColumn_usgs_observed_UTC_${site_name}

# Creating the final USGS observation file by pasting date/time and processed data
paste DateTimeColumn_usgs_observed_UTC_${site_name} fort.71 > WL-${site_name}-USGS2

# We get rid of the data that falls behind the start date of the validation cycle
# We need to redefine the parameter of start of the validation cylce to add the HH:MM

begin_date_cut=`timeout 5 date +%Y-%m-%d --date="$st_y-$st_m-$st_d $en_h:$en_mm"`

# PT- update Jul1-2019: If there is no old fort.61 available for validation --------------
# (mainly happens when the job submited for the first time and old                        |
# forecasts not exist), the $s variable would be empty, and the                           | 
# command returns error, but rather than be terminated, it halts and so does              |
# the process. Timeout fix this issue ----------------------------------------------------

timeout 5 grep $begin_date_cut -A 1000 WL-${site_name}-USGS2 > WL-${site_name}-USGS

echo "Info: Final file containing a Date/Time in UTC and water level data at ${site_name} is created: WL-${site_name}-USGS"
echo ""
echo "        D O N E        "
echo ""

# Cleaning
rm DateTimeColumn_usgs_observed_UTC_* fort.71 trimmed-observed-${site_name} raw-observed-${site_name}

# 
exit
