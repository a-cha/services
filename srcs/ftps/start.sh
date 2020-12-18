#! /bin/sh

adduser -D sadolph

echo "sadolph:sadolph" | chpasswd

vsftpd /etc/vsftpd/vsftpd.conf