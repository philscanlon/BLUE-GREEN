# SETUP commands

SEMP is used to manage router configuration.

## use a variable for the Solace Router HOST before running the CURL commands
export vmr_ip=localhost


## Set the REST VPN to gateway

TODO  SEMP configuration

## queue

: /msgVpns/{msgVpnName}/queues
: msgVpnName
: queueName

~~~
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"AA", "permission":"consume", "ingressEnabled":true, "egressEnabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"FY", "permission":"consume", "ingressEnabled":true, "egressEnabled":true}'
~~~

## Queue subscriptions
: /msgVpns/{msgVpnName}/queues/{queueName}/subscriptions
: msgVpnName
: queueName
: subscriptionTopic

~~~
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"*/scale/*/*/*/AA"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"*/scale/*/*/*/AA/>"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/FY/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"FY","subscriptionTopic":"*/scale/*/*/*/FY"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/queues/FY/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"FY","subscriptionTopic":"*/scale/*/*/*/FY/>"}'

~~~

## Rest Delivery Point
: /msgVpns/{msgVpnName}/restDeliveryPoints
: restDeliveryPointName

~~~
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"blue", "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"green", "enabled":false}'

~~~

## Queue Binding

: /msgVpns/{msgVpnName}/restDeliveryPoints/{restDeliveryPointName}/queueBindings
: msgVpnName
: queueBindingName
: postRequestTarget

~~~
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"blue","postRequestTarget":"/"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"FY","restDeliveryPointName":"blue","postRequestTarget":"/"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/queueBindings -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"green","postRequestTarget":"/"}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/queueBindings -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"FY","restDeliveryPointName":"green","postRequestTarget":"/"}'
~~~


## Rest Consumer

: /msgVpns/{msgVpnName}/restDeliveryPoints/{restDeliveryPointName}/restConsumers
: msgVpnName
: restConsumerName
: restDeliveryPointName
: remoteHost
: remotePort

~~~
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_a_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"192.168.56.1","remotePort":1981, "tlsEnabled":false, "enabled":true}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_b_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"192.168.56.1","remotePort":1982, "tlsEnabled":false, "enabled":false}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_c_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"192.168.56.1","remotePort":1983, "tlsEnabled":false, "enabled":false}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_a_green","restDeliveryPointName":"green","remoteHost":"192.168.56.1","remotePort":1985, "tlsEnabled":false, "enabled":false}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_b_green","restDeliveryPointName":"green","remoteHost":"192.168.56.1","remotePort":1986, "tlsEnabled":false, "enabled":false}'
curl -X POST -u admin:admin $vmr_ip:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_c_green","restDeliveryPointName":"green","remoteHost":"192.168.56.1","remotePort":1987, "tlsEnabled":false, "enabled":false}'


~~~
# Control commands

: Activate a consumer
: Activate the Endpoints
