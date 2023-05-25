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








