#!/usr/bin/expect

set host [lindex $argv 0]
set port [lindex $argv 1]

spawn ftp $host $port
expect "ftp>"
send "ls\r"
expect "ftp>"
send "quit\r"
expect eof

