#!/bin/bash
# 
# Getting sea surface height above geiod
# -----------------------------------------------

# reading and applying config parameter
config=$1
. ${config}

# ---------------------------------------------------------------------
# Getting the data starting 2 days ago in NAVD88, taking an aevrage    |
# and report it as the sshag based on NAVD88                           |
# ---------------------------------------------------------------------

# Today and 2 days ago
today=`date +'%Y%m%d' -d "1 day ago"`
twodayago=`date +'%Y%m%d' -d "20 days ago"`

# Constructing the URL
url="https://tidesandcurrents.noaa.gov/api/datagetter?product=predictions&application=NOS.COOPS.TAC.WL&begin_date=$twodayago&end_date=$today&datum=$datum&station=$site&time_zone=GMT&units=$unit&interval=$interval&format=xml"

echo $url

# Downloading
wget $url -O WL-$site-raw

# formating downloded data
cat WL-$site-raw | cut -d'"' -f2,4 | sed  's/"/  /g' | grep ':00' | cut -d' ' -f4 > WL-$site-$datum-obs

# Taking Average
count=0
total=0
for i in $( awk '{ print $1; }' WL-$site-$datum-obs )
  do 
  total=$(echo $total+$i | bc )
  ((count++))
  done
sshag=`echo "scale=2; $total / $count" | bc`

# writing to log file
today=`date +'%Y-%m-%d'`
echo "$sshag $today" >> log.SSHAG

# For the use of forcast run
echo $sshag > SSHAG

# Cleaning
rm WL-$site-raw WL-$site-$datum-obs
