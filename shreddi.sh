#!/bin/bash

# shreddi - Shred the block devices given on the command line.
# Beep when done

SHREDOPTS="-v -n1"

startt=$SECONDS

for disk in "$@"
do
	sudo /usr/bin/shred ${SHREDOPTS} /dev/$disk &
done

wait

sudo sync
sudo sync
sudo sync

# My USB dual disk toaster powers off both disks with call to either
for disk in "$@"
do
    [ -e /dev/$1 ] && sudo udisksctl power-off -b /dev/$1
done

endt=$SECONDS
elapsedt=$(( endt - startt ))

echo "Shreddi completed shred of $@ in $elapsedt seconds."
beep -f 2500 -l 50 -r 10

# TODO annoying beep is only good if you are around to hear it
#  Better yet would be to turn on a light or something as a signal
#  that it is time for the next cycle
#  https://mborgerson.com/hacking-the-blynclight/ is a good idea

