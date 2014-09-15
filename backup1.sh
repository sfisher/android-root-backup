#!/bin/bash
./adb forward tcp:5555 tcp:5555
./adb shell <<EOD
su
rm /cache/myfifo
busybox mkfifo /cache/myfifo
busybox tar -cvf /cache/myfifo $1
EOD
