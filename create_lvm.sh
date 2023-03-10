#!/bin/bash
#Für sda und sdb msdos labeln und jeweils eine Partition mit einer größe von 800MB erstellen. Beide Partitionen als Physical Volume deklarieren.
for letter in {a,b}
do
        /usr/sbin/parted /dev/sd$letter  mklabel msdos
        /usr/sbin/parted /dev/sd$letter mkpart primary 1 801
        /usr/sbin/pvcreate /dev/sd${letter}1
done

#Volume Group "vgscript" erstellen und beide Physical Volumes zuweisen
/usr/sbin/vgcreate vgscript /dev/sda1 /dev/sdb1

#Alle drei Logical Volumes lvscript1..3 mit einer größe von je 500MB welcher von der vg vgscript bezogen wird, erstellen
for NUMBER in {1..3}
do
/usr/sbin/lvcreate -L 500 -n lvscript$NUMBER vgscript
done
exit
