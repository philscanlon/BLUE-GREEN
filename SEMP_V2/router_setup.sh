#!/bin/sh

echo "usage: basic_load.sh username password host port"
echo "Press [CTRL+C] to stop.."
# SETUP commands

SEMP is used to manage router configuration.

# use a variable for the Solace Router HOST before running the CURL commands
export vmr_ip=e40
export backend_ip=192.168.1.228

# Set the REST VPN to gateway
# todo

# queue
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"AA", "permission":"consume", "ingressEnabled":true, "egressEnabled":true, "respectTtlEnabled":true, "maxTtl":10}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"FY", "permission":"consume", "ingressEnabled":true, "egressEnabled":true, "respectTtlEnabled":true, "maxTtl":10}'

# Queue subscriptions
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"*/scale/*/*/*/AA"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"*/scale/*/*/*/AA/>"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/FY/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"FY","subscriptionTopic":"*/scale/*/*/*/FY"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/FY/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"FY","subscriptionTopic":"*/scale/*/*/*/FY/>"}'

# Rest Delivery Point
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"blue", "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"green", "enabled":true}'

# Queue Binding
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"blue","postRequestTarget":"/"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"FY","restDeliveryPointName":"blue","postRequestTarget":"/"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/queueBindings -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"green","postRequestTarget":"/"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/queueBindings -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"FY","restDeliveryPointName":"green","postRequestTarget":"/"}'

#Rest Consumer
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_a_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"'"$backend_ip"'","remotePort":1981, "tlsEnabled":false, "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_b_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"'"$backend_ip"'","remotePort":1982, "tlsEnabled":false, "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_c_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"'"$backend_ip"'","remotePort":1983, "tlsEnabled":false, "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_a_green","restDeliveryPointName":"green","remoteHost":"'"$backend_ip"'","remotePort":1985, "tlsEnabled":false, "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_b_green","restDeliveryPointName":"green","remoteHost":"'"$backend_ip"'","remotePort":1986, "tlsEnabled":false, "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_c_green","restDeliveryPointName":"green","remoteHost":"'"$backend_ip"'","remotePort":1987, "tlsEnabled":false, "enabled":true}'
