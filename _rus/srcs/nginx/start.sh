#!/bin/sh

openrc default
rc-service sshd start
nginx -g "daemon off;"
