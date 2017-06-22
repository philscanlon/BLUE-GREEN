#!/bin/sh

# Run backend services
node-red scb_scale_backend -s scb_settings_backend.js &
node-red scb_scale_backend -s scb_settings_backend2.js &
