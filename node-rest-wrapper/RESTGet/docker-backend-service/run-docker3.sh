#!/bin/sh
docker run -d \
-p 1983:1981 \
-v /home/ec2-user/demo/RESTGet/backend-service3:/usr/src/backend \
--name solace-rest-service3 easuncion/solace-rest-backend:latest
