#!/bin/bash

echo 'output from simplercolor.sh:'
echo
source ~/colortests/simplercolor.sh

echo 'output from 256colors2.pl:'
echo
perl ~/colortests/256colors2.pl

echo 'example ls test-directory:'
echo
ls --color=auto ~/colortests/test-directory

echo '===================='
xrdb -q
echo '===================='


dircolors
echo '===================='
echo '$TERM is =' $TERM

