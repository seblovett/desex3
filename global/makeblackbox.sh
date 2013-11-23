#!/bin/sh
echo $1
echo $2
cp inv.mag blackbox.mag
python ../global/prepblackbox.py $1
magic -d null -T c035u blackbox.mag < bbprep
