#!/bin/sh

# Update node modules
# cd /usr/src/app
# npm install

# Run facade & backend services

node-red scb_scale_facade_in -s scb_settings_facade_in.js &

node-red scb_scale_facade_out -s scb_settings_facade_out.js &
node-red scb_scale_facade_out2 -s scb_settings_facade_out2.js &
node-red scb_scale_facade_out3 -s scb_settings_facade_out3.js &

# Run VMR
#/usr/sbin/boot.sh
