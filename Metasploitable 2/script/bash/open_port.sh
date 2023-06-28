#!/usr/bin/expect

set host [lindex $argv 0]
set username "sebas:)"
set password "pass"

spawn ftp $host
expect "Name*:"
send "$username\r"
expect "Password:"
send "$password\r"




