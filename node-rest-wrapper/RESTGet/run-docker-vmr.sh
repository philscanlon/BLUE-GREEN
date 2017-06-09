#!/bin/sh
docker run -d \
--network=host \
--uts=host \
--shm-size=2g \
--ulimit core=-1 \
--ulimit memlock=-1 \
--ulimit nofile=2448:38048 \
--cap-add=IPC_LOCK \
--cap-add=SYS_NICE \
--env 'username_admin_globalaccesslevel=admin' \
--env 'username_admin_password=admin' \
--name=solace solace-app:latest
