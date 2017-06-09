#!/bin/sh
docker run -d \
-p 1984:1981 \
-v /home/ec2-user/demo/RESTGet/backend-service4:/usr/src/backend \
--name solace-rest-service4 easuncion/solace-rest-backend:latest
