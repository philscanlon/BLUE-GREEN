#!/bin/sh

# Start the mock back end blue servers
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend_b1.js &
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend_b2.js &
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend_b3.js &

# Start the mock back end green servers
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend_g1.js &
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend_g2.js &
node-red ./backend-service/scb_scale_backend -s ./backend-service/scb_settings_backend_g3.js &
