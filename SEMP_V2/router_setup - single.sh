#!/bin/sh

echo "usage: basic_load.sh username password host port"
echo "Press [CTRL+C] to stop.."
# SETUP commands

SEMP is used to manage router configuration.

# use a variable for the Solace Router HOST before running the CURL commands
export vmr_ip=localhost
export backend_ip=192.168.1.228

# Set the REST VPN to gateway
# todo

# queue
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"AA", "permission":"consume", "ingressEnabled":true, "egressEnabled":true, "respectTtlEnabled":true, "maxTtl":10}'

# Queue subscriptions - source URL http://solace-server:port/get/AA
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"*/AA"}'

# Rest Delivery Point
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"aa", "enabled":true}'

# Queue Binding
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/aa/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"aa","postRequestTarget":"/"}'

#Rest Consumer target URL http://backend-server:port/get/AA
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/aa/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"backend_aa" ,"restDeliveryPointName":"aa" ,"remoteHost":"'"$backend_ip"'","remotePort":1981, "tlsEnabled":false, "enabled":true}'
