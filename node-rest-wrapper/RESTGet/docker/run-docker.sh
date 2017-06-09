#!/bin/sh
docker run -d \
-p 1880:1880 \
-p 1881:1881 \
-v /home/ec2-user/demo/RESTGet/app:/usr/src/app \
--shm-size 4g \
--network=host \
--uts=host \
--ulimit core=-1 \
--ulimit memlock=-1 \
--ulimit nofile=2448:38048 \
--cap-add=IPC_LOCK \
--cap-add=SYS_NICE \
--env 'username_admin_globalaccesslevel=admin' \
--env 'username_admin_password=admin' \
--name solace-rest-get easuncion/solace-rest-get:latest
