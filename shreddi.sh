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
# My USB3 dual disk toaster powers off both disks with call to either.
# If that is not your setup, make this a loop
sudo udiskctl power-off -b /dev/$1

endt=$SECONDS
elapsedt=$(( endt - startt ))

echo "Shreddi completed shred of $@ in $elapsedt seconds."
beep -f 2500 -l 50 -r 10

# TODO annoying beep is only good if you are around to hear it
#  Better yet would be to turn on a light or something as a signal
#  that it is time for the next cycle


