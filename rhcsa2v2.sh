#!/bin/bash
read input
if [ $input == "RHCSA" ]
then
        echo "RHCE"
elif [ $input == "RHCE" ]
then
        echo "RHCSA"
else
        echo "You need to either write RHCSA or RHCE!!"
fi
exit
