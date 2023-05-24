# Hello

#  ssh banditN@bandit.labs.overthewire.org -p 2220

## Level 0-1 
    $ cat README

## Level 1-2 
    $ cat /-
    key: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

## Level 2-3

    $ cat spaces\ in\ this\ filename
    key: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

## Level 3-4
    $ ls -la
    $cat .hidden
    key: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

## Level 4-5
    $ cat ./-file07
    key: lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

## Level 5-6
    $ find inhere/ -type f -size 1033c
    $ cd inhere/maybehere07/ && cat .file2
    key: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU

## Level 6-7
    $ find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
    $ cd /var/lib/dpkg/info/ && cat bandit7.password
    key: z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S

## Level 7-8
    $ grep -r millionth data.txt
    key: TESKZC0XvTetK0S9xNwm25STk5iWrBvP

## Level 8-9
    $ sort data.txt | uniq -u
    key: EN632PlfYiZbn3PhVK3XOGSlNInNE00t

## Level 9-10
   $ grep -aoP '(=+)[[:print:]]+' data.txt | sed 's/=//'
   key: G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

## Level 10-11
    $ base64 --decode data.txt
    key: 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM

## Level 11-12
   $ tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
   key: JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv




