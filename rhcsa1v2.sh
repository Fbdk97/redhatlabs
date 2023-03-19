#!/bin/bash
NUMBER=555
for COUNT in {1..3}
do
	/usr/sbin/useradd user$NUMBER -s /sbin/nologin
	echo "user$NUMBER" | /usr/bin/passwd --stdin user$NUMBER
	/usr/bin/cat /etc/passwd | grep user$NUMBER >> /var/tmp/newusers
	NUMBER=$((NUMBER+111))
done
exit
#Nun, um GIT auszuprobieren, füge ich mal diese Zeile hinzu, um das ganze bezüglich Versionskontrolle mal genauer zu testen.
#Jetzt sogar eine zweite Zeile.
		
