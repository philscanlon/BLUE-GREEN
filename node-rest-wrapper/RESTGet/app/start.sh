#!/bin/sh

# Run facade & backend services

node-red scb_scale_facade_in -s scb_settings_facade_in.js &

node-red scb_scale_facade_out -s scb_settings_facade_out.js &
node-red scb_scale_facade_out -s scb_settings_facade_out2.js &
