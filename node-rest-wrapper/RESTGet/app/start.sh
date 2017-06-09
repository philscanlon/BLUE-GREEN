#!/bin/sh

# Update node modules
cd /usr/src/app
npm install

# Run facade & backend services
#nohup node-red scb_scale_facade -s scb_settings_facade.js >/dev/null 2>&1 &
node-red scb_scale_facade_in -s scb_settings_facade_in.js &
#nohup node-red scb_scale_backend -s scb_settings_backend.js >/dev/null 2>&1 &
node-red scb_scale_facade_out -s scb_settings_facade_out.js &
node-red scb_scale_facade_out2 -s scb_settings_facade_out2.js &
node-red scb_scale_facade_out3 -s scb_settings_facade_out3.js &

# Run VMR
#/usr/sbin/boot.sh
