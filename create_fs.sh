#!/bin/bash
fs=("xfs" "ext4" "vfat")
for count in {0..2}
do
	/usr/bin/mkdir /mnt/${fs[$count]}
	/usr/sbin/mkfs.${fs[$count]} /dev/vgscript/lvscript$((count+1))
	echo "/dev/vgscript/lvscript$((count+1)) /mnt/${fs[$count]} ${fs[$count]} defaults 0 0" >> /etc/fstab
done
/usr/sbin/mount -a
/usr/bin/df -h
exit
