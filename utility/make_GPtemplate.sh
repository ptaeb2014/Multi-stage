#!/bin/bash
# 
# Create Gnuplot templates
#
# Function:
#   This program is a utility code that facilitates the
#   creation of gnuplot template files and is run
#   by the user before the system is placed in operations.
#   
#   The template consists of several line plots as it incorporates
#   the demonstration of ensemble members individually as well 
#   as the ensemble spread by shading between lines.
#   Manual creation of them is then time-intensive and burdensome.
#   Furthermore, the user must update all of the column numbers
#   each time a station output is added or removed.
#   This program is intended to get the templates written 
#   completely automated. It is under development.
#
#   Currently, the script has primitive functionality. It can be
#   used for creating templates for each station thought, requiring
#   less effort than complately manual preparations.
#   Note that the templates for each station need to be
#   created again if a station output is added or removed.
#
#   This code reads a template of GNUPLOT and
#   writes the column numbers associated with
#   each forecast ensemble run.
#   It also asks the user to insert some otehr
#   variables like the station name, and writes them
#   into the template. 
#
#   A copy of template is created in the beginning of the
#   process to ensure that a template file always exists.
#   
#   Author:
#          Peyman Taeb - March2019
# --------------------------------------------------------
# Syntax
echo""
echo " INFO: Syntax: "
echo "     ./make_GPtemplate.sh  tnem temp input"
echo "      Where"
echo "         tnem......Total number of ensemble number"
echo "         temp......The Gnuplot template"
echo "         input.....Input file containing lat/lon of stations"
echo ""

# Options
tnem=$1		   # Total number of ensemble number
temp=$2
input=$3

# tnso: Total number of station output
tnso=`wc -l ${input} | cut -d' ' -f1 `

# initializing nl: Number of the line of the station 
# file containing station specification
nl=0

# Loop over the stations (Stations' names are read form this + Lat/Lon )
while IFS= read -r line
do
 
  # updating line number
  nl=`echo "$nl" + "1" | bc -l`

  echo "nl: " $nl
  echo ""

  # Make a copy of temp so that the file does not disappear after seding
  cp $temp template_origin

  # Station name
  stationName=`echo $line |  awk -F\" '{print $2}'`
  echo ""
  echo " ......... Started working on state: " $stationName "............."
  echo ""
  
  # Name of the organization/institute/department that provides the observation data
  echo "      Writing the name of the obs provider, e.g. NOAA, CPRG, USGS, or "
  echo "      Or, non-obs if no observation is presented at this location"
  provider=`echo $line | awk -F\" '{print $4}'`
  echo "      Provider: " $provider   

  # First correcting the header if it is an non-obs station
  if [[ "$provider" == "non-obs" ]]; then
     a="       Validation cycle: %oldcycle%                                                                                               Current cycle: %cycle%                                                    "
     b="Current cycle: %cycle%"
     sed -i "s/${a}/${b}/g" "$temp"
  fi

  # Now writing the provider
  echo ""
  sed -i "s/%provider%/$provider/g" $temp

  # writing the station name                                                            
  sed -i "s/%stationname%/$stationName/g" $temp

  # format of single_fort61/swan61
  # YYYYMMDD  TIME  TIMEZONE   S1   S2   S...   YYYYMMDD  TIME  TIMEZONE  S1   S2   S...
  # cte refers to the first three elements 
  cte=3

  # One output (at the same location) is repeated by another
  # ensemble member every skip paramter
  skip=`echo "$tnso" + "$cte" | bc -l`

  # First element
  par_0=`echo "$cte" + "$nl" | bc -l`

  # Substituting the 1st element
  sed -i "s/%el1%/${par_0}/g" $temp

  # Initializations
  j=1

  # Constructing the array el
  for (( i=2; i<=${tnem}; i++ )) ;
  do
    # Second elements
    par=`echo "$par_0" + "$skip" | bc -l`
    par_0=$par

    # Substituting the remaning elements
    sed -i "s/%el${i}%/$par/g" $temp
  done

  # Notyfying
  echo "      Finishing wirting column numbers"
  echo ""

  # Grep the station name after ! and set it as the name of ps ``````````````````````````````````````````
  echo "      Writing output name"
  outputname=`echo $line | awk '{print $4}'`
  echo "      outputname: " $outputname
  echo ""
  sed -i "s/%outputname%/$outputname/g" $temp

   # LAT & LON  
  echo "      Writing lat/lon of the station"
  lon=`echo $line | awk '{print $1}' | sed 's/-//g' | cut -c1-6`
  lon="${lon}W"
  echo "      Longitude: " $lon
  sed -i "s/%lon%/$lon/g" $temp

  lat=`echo $line | awk '{print $2}' | cut -c1-6`
  lat="${lat}N"
  echo "      Longitude: " $lat
  echo ""
  sed -i "s/%lat%/$lat/g" $temp

  # Y LABEL      
  echo "      Writing the Y label"
  ylabel=`echo $line |  awk -F\" '{print $6}'`
  echo "      Y-label: " $ylabel     
  echo ""
  sed -i "s/%ylabel%/$ylabel/g" $temp

  # output type
  echo "      Writing the output type. options: Water level (1) "
  echo "      current velocity (2), wind (3), waves (4)"
  outputtype=`echo $line |  awk -F\" '{print $8}'`
  echo "      Output tpye: " $outputtype
  echo ""
  if [[ "$outputtype" == "1" ]]; then
     filename="single_fort61"
     oldfilename="single_fort61_old"
  elif [[ "$outputtype" == "2" ]]; then
     filename="single_fort62"
     oldfilename="single_fort62_old"
  elif [[ "$outputtype" == "3" ]]; then
     filename="single_fort72"
     oldfilename="single_fort72_old"
  elif [[ "$outputtype" == "4" ]]; then
     filename="single_swan61"
     oldfilename="single_swan61_old"
  fi                                
  sed -i "s/%filename%/$filename/g"        $temp

  # Give a wrong filename so that gnuplot skip validation plot if it is an non-obs station"
  if [[ "$provider" == "non-obs" ]]; then
     sed -i "s/%oldfilename%/wrongname/g"  $temp
  else
     sed -i "s/%oldfilename%/$oldfilename/g"  $temp
  fi

  # observation file name
  echo "      Writing the name of observation file"
  obsname=`echo $line |  awk -F\" '{print $10}'`
  if [ ! -z "$obsname" ]; then
     echo "      Obs filename: " $obsname
     echo ""
     sed -i  "s/%obsname%/$obsname/g" $temp
  else
     sed -i  "/%obsname%/d"           $temp
     echo "      No obs available at this station"
     echo ""
  fi

  # Vertical line name 
  echo "      Writing the the name of the vertical line"
  vertical=`echo $line |  awk -F\" '{print $12}'`
  if [ ! -z "$vertical" ]; then
     echo "      Vertical line: " $vertical
     echo ""
     sed -i  "s/%vertical%/$vertical/g" $temp
  else 
     sed -i  "/%vertical%/d"            $temp
     echo "      No obs available at this station"
     echo ""
  fi

  # Renaming the template
  mv $temp gnuplot_"$outputname".gp
  echo "      The template is created: gnuplot_"$outputname".gp"
  echo ""

  # Renaming the backup template
  mv template_origin template.gp
  
  # 
  # sleep 2

done < "$input"
