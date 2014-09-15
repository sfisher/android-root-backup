Getting this script to run requires a few prerequisites.

1. Copy these files into your platform-tools directory (or where adb is located).
2. chmod u+x backup*.sh if on linux.
3. Reboot into recovery on device (volume down and power).
4. Mount partitions in your recovery software such as TWRP on device.
5. Change to the Google platform-tools directory where adb is located.
6. ./adb devices #-- should list device (./adb start-server might also be useful), if not driver problems
7. ./adb shell mount #-- will show mount points.
8. Be sure you have nc (netcat) and pv (pipeviewer) utilities installed in cygwin/linux or the scripts won't work.
9. On your Android device you need root and also busybox installed and in path. (mkfifo, cat, nc)


You can backup just one mount like this example:

./backup.sh /system 2014-07-18-nex4.system.tar.gz


You can make 1-command backup by copying and/or modifying the backup_gpad83.sh or backup_nex4.sh files.
Change the following things in these files for your desired backup.

1. Path where you'd like to save in "savedir=" line.
2. The mount points you'd like to backup in the line starting with "declare".
   Put the items in quotes.  You do not usually have to back up /sdcard since it
   is included in /data on newer devices.  Do ./adb shell mount to look at mount points.
3. sudo su #this will avoid possible permissions issues while running the scripts.
4. ./backup_<devicescript>.sh

If you ever need to extract the contents of these files do "tar -zxvf <filename>.tar.gz"
