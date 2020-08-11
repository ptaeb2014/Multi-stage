#/bin/bash

# Options
SYSLOG=$1
config=$2
cycleDir=$3

# Getting variables from config
. ${config}
. ${mainDIR}/src/logging.sh

# ------------------------------------------------------------
#                  Archiving and GitHubbing

cd $mainDIR/$ID/$cycleDir

validationDir=( validation_s1 validation_s2 )
for (( i=0 ; i<=1 ; i++ )) ;
do
   cd ${validationDir[$i]}
 
   # Archiving ps files for future use
   for file in `ls *.ps`
   do 
     # Folder name is the same as PS file excluding .ps
     # The following command trim the last 3 character: .ps
     folder=`echo "${file::-3}"`
     echo $file
     cp $file $mainDIR/archive/$folder/$cycleDir'.ps'
   done

   # Copying jpg files for GitHub & Website
   for file in `ls *.jpg`
   do
     # Folder name is the same as PS file excluding .ps
     # The following command trim the last 3 character: .ps
     if [ ! -e  ${github}/plots/ ]; then 
        mkdir ${github}/plots/
     fi 
     cp $file ${github}/plots/
 
     cd ${github}         
     git remote add origin https://github.com/ptaeb2014/Multi-stage.git
     git config credential.helper store 
     git add plots/$file
     git commit -m "Upload $cycleDir"    
     git push origin master
     cd -

   done
   
   # redirect to  $mainDIR/$ID/$cycleDir
   cd $mainDIR/$ID/$cycleDir

done

# 4 more things for GitHub
cp $mainDIR/$ID/$cycleDir/nam/S1/full_elev_wind.gif ${github}/plots/full_elev_wind.gif
cp $mainDIR/$ID/$cycleDir/nam/S1/full_hs_dir.gif    ${github}/plots/full_hs_dir.gif   

cp $mainDIR/$ID/$cycleDir/nam/S2/irl_elev_wind.gif  ${github}/plots/irl_elev_wind.gif
cp $mainDIR/$ID/$cycleDir/nam/S2/irl_hs_dir.gif     ${github}/plots/irl_hs_dir.gif

filess=( full_elev_wind.gif full_hs_dir.gif irl_elev_wind.gif irl_hs_dir.gif )

# cd GITHUB
cd ${github}
git remote add origin https://github.com/ptaeb2014/Multi-stage.git
git config credential.helper store

# Writing the current forecast cycle
cp $mainDIR/utility/index_sample.md index.md
YMD=`echo $cycleDir | cut -c1-8`
cycle=`echo $cycleDir | cut -c9-10`
startreadableDate=`date +'%a %b %d %Y' -d "$YMD"`

sed -i "s/%startcycle%/${startreadableDate}/g" index.md
sed -i "s/%CYCLEE%/"${cycle}"/g" index.md

git add index.md
git commit -m "Upload $cycleDir"
git push -f origin master

for (( i=0 ; i<=3 ; i++ )) ;
do
    git add plots/${filess[$i]}
    git commit -m "Upload $cycleDir"
    git push -f origin master
done

# ------------------------------------------------------------
#                       Free up space

# Directing tdirectory containig forecast cycles (working dir)
cd $mainDIR/$ID

# Find the directory created 6 days before the creation of the
# latest directory
#     i.e. If the system stops running, the current and recent
#     directorie won’t be deleted. Only those will be deleted 
#     that are 6 days older than the latest ones.
current=`cat currentCycle`

# Finding old directories
old_dir=`date +'%Y%m%d' -d "$currentCycle 6 days ago"`
	
# List all files in the working dir 
list=`find * -maxdepth 0 -type d | grep $old_dir`

# Deleting
rm -rf echo $list 

# Reporting
deleted=`find * -maxdepth 0 -type d | grep $old_dir`
logMessage "Old forcast directories deleted $deleted"
