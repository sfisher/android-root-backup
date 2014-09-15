#!/bin/bash
if [ $# -ne 2 ]; then
   echo ""
   echo "Usage: $0 [mount path] [outputfile (tar.gz)]"
   echo ""
   echo "You need to do sudo ./adb start-server before running or it may not work."
   echo ""
   echo "./adb shell mount will give you mount points. Common backups are /data (may be same as /sdcard)"
   echo "/system, /boot, /recovery, /misc"
   echo ""
   echo "Try ./adb devices to be sure your device is showing up correctly."
   echo ""
   echo "It may be also helpful to disable and re-enable the device if not working."
   exit 1
fi
./adb devices
{
  ./backup1.sh "$1" &
} >/dev/null 2>&1
sleep 7
{
  ./backup2.sh &
} >/dev/null 2>&1
sleep 7
./adb forward tcp:5555 tcp:5555
nc 127.0.0.1 5555 | pv -i 0.5 | gzip > $2
#nc 127.0.0.1 5555 | pv -i 0.5 > $2
trap 'kill $(jobs -p)' EXIT
