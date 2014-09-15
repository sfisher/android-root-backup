#!/bin/bash
timestamp=`(date +"%Y-%m-%d_%H-%M")`
save_dir="/media/scott/big_backup/other_backups/android_backups/nexus4/"
#sdcard not needed below since it's inside data
declare -a items=( "/data" "/cache" "/system" )
for i in "${items[@]}"
do
   myvar="./backup.sh ""$i ""$save_dir$timestamp"_`echo $i | sed 's/\///'`".tar.gz"
   echo $myvar
   eval "$myvar"
   echo
done
