#!/bin/sh
docker run -d \
-p 1981:1981 \
-v /home/ec2-user/demo/RESTGet/backend-service:/usr/src/backend \
--name solace-rest-service1 easuncion/solace-rest-backend:latest
