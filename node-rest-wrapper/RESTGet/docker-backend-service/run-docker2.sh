#!/bin/sh
docker run -d \
-p 1982:1981 \
-v /home/ec2-user/demo/RESTGet/backend-service2:/usr/src/backend \
--name solace-rest-service2 easuncion/solace-rest-backend:latest
