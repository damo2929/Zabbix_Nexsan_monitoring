#!/usr/bin/expect -c
set timeout 5
set TARGET_HOSTIP [lindex $argv 0]
set TARGET_USERNAME [lindex $argv 1]
set TARGET_PASSWORD [lindex $argv 2]
set TARGET_COMMAND [lindex $argv 3]

log_user 0
spawn  nc $TARGET_HOSTIP 44844
expect "220"
send "USER $TARGET_USERNAME\n"
expect "331 User OK, need password"
send "PASS $TARGET_PASSWORD\n"
expect "230 User logged in"
log_user 1
send "SHOW $TARGET_COMMAND\n"
expect "."
log_user 0
send "QUIT"
