#!/bin/sh

# Start the mock back end servers
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend.js &
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend2.js &
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend3.js &


# Run facade in & facade out services (wrapper around appliance)

node-red ./app/scb_scale_facade_in -s ./app/scb_settings_facade_in.js &

node-red ./app/scb_scale_facade_out -s ./app/scb_settings_facade_out.js &
node-red ./app/scb_scale_facade_out -s ./app/scb_settings_facade_out2.js &
node-red ./app/scb_scale_facade_out -s ./app/scb_settings_facade_out3.js &
