#!/bin/bash
echo $1
[[ -d /tmp/muttattach ]] || mkdir /tmp/muttattach
sudo cp $1 /tmp/muttattach/
sudo chmod a+rx /tmp/muttattach/$(basename $1)
echo $1 > /tmp/muttattach/filename_fifo
