#!/bin/sh

# Update node modules
cd /usr/src/backend
npm install

# Run backend services
node-red scb_scale_backend -s scb_settings_backend.js
