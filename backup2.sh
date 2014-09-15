#!/bin/bash
./adb forward tcp:5555 tcp:5555
./adb shell <<EOD
su
busybox nc -l -p 5555 -e busybox cat /cache/myfifo
EOD
