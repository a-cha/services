#!/bin/bash
set -x
openrc default
service influxdb start
echo "CREATE DATABASE infdb;"
echo "CREATE USER 'admin' WITH PASSWORD 'admin' WITH ALL PRIVILEGES;"
echo "GRAND ALL ON infdb to admin;"


sh