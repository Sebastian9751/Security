# Hello

#  ssh banditN@bandit.labs.overthewire.org -p 2220

## Level 0-1 


## Level 1-2 
#### The password for the next level is stored in a file called - located in the home directory
    $ cat /-
    key: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

## Level 2-3
#### The password for the next level is stored in a file called spaces in this filename located in the home directory
    $ cat spaces\ in\ this\ filename
    key: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

## Level 3-4
#### The password for the next level is stored in a hidden file in the inhere directory.
    $ ls -la
    $cat .hidden
    key: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

## Level 4-5
#### The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command.
    $ cat ./-file07
    key: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

## Level 5-6
#### The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:
 - human-readable
 - 1033 bytes in size
 - not executable
#
    $ find inhere/ -type f -size 1033c
    $ cd inhere/maybehere07/ && cat .file2
    key: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU

## Level 6-7
#### The password for the next level is stored somewhere on the server and has all of the following properties:
- owned by user bandit7
- owned by group bandit6
- 33 bytes in size
#
    $ find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
    $ cd /var/lib/dpkg/info/ && cat bandit7.password
    key: z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S

## Level 7-8
#### The password for the next level is stored in the file data.txt next to the word millionth
    $ grep -r millionth data.txt
    key: TESKZC0XvTetK0S9xNwm25STk5iWrBvP

## Level 8-9
#### The password for the next level is stored in the file data.txt and is the only line of text that occurs only once
    $ sort data.txt | uniq -u
    key: EN632PlfYiZbn3PhVK3XOGSlNInNE00t

## Level 9-10
#### The password for the next level is stored in the file data.txt in one  of the few human-readable strings, preceded by several ‘=’ characters.

    $ grep -aoP '(=+)[[:print:]]+' data.txt | sed 's/=//'
    key: G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

## Level 10-11
#### The password for the next level is stored in the file data.txt, which contains base64 encoded data
    $ base64 --decode data.txt
    key: 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM

## Level 11-12
#### The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions
    $ tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
    key: JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv

## Level 12-13
#### The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)
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
    






