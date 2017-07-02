#!/bin/bash

echo 'output from simplercolor.sh:'
echo
source ./tests/simplercolor.sh

echo 'output from 256colors2.pl:'
echo
perl ./tests/256colors2.pl

echo 'example ls test-directory:'
echo
ls --color=auto ./test-directory

echo '===================='
xrdb -q
echo '===================='


dircolors
echo '===================='
echo '$TERM is =' $TERM

