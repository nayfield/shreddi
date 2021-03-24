# shreddi
For those mass erasing events


### How I use it, ymmv

- terminal 1: dmesg -w (to see scsi errors)
- terminal 2: iotop (to see speed)
- terimnal 3: ./shreddi.sh sdb sdc (to shred)

### Notes

- DoD 5220.22-M is a 3 pass wipe.  
- [NIST 800-88 Rev. 1](http://csrc.nist.gov/publications/drafts/800-88-rev1/sp800_88_r1_draft.pdf) says a 1-pass wipe is sufficient for ATA drives over 15GB.

