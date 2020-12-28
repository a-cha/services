#! /bin/sh

adduser -D sadolph
echo "sadolph:sadolph" | chpasswd

ssh-keygen -A

/usr/bin/supervisord -c /etc/supervisord.conf
