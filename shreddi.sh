#!/bin/bash

# shreddi - Shred the block devices given on the command line.
# Beep when done

SHREDOPTS="-v -n1"

startt=$SECONDS

for disk in "$@"
do
	echo sudo /usr/bin/shred ${SHREDOPTS} /dev/$disk &
done

wait

echo sudo sync
# My USB3 dual disk toaster powers off both disks with call to either.
# If that is not your setup, make this a loop
echo sudo udiskctl power-off -b /dev/$1

endt=$SECONDS
elapsedt=$(( endt - startt ))

echo "Shreddi completed shred of $@ in $elapsedt seconds."
beep -f 2500 -l 50 -r 10
