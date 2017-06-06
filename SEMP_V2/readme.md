# SETUP commands

SEMP is used to manage router configuration.  The commands are included in the SoapUI project,  also  here as CURL if you would like to run the sample without using SoapUI.

~~~
curl -X POST -u user:password solacevmr:8080/SEMP/v2/config/msgVpns/queues \
  -H "content-type: application/json" \
  -d '{"msgVpnName" :"default","queueName":"AA"}'
~~~



## queue

/msgVpns/{msgVpnName}/queues

msgVpnName
queueName

~~~
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"AA"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/queues -H "content-type: application/json" -d '{"msgVpnName" :"default","queueName":"BB"}'
~~~



## Queue subscriptions
/msgVpns/{msgVpnName}/queues/{queueName}/subscriptions


msgVpnName
queueName
subscriptionTopic


~~~

curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"scale/*/*/*/AA"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/queues/AA/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"AA","subscriptionTopic":"scale/*/*/*/AA/>"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/queues/BB/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"BB","subscriptionTopic":"scale/*/*/*/BB"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/queues/BB/subscriptions -H "content-type: application/json" -d '{"msgVpnName":"default","queueName":"BB","subscriptionTopic":"scale/*/*/*/BB/>"}'

~~~

## Rest Delivery Point
/msgVpns/{msgVpnName}/restDeliveryPoints

restDeliveryPointName

~~~
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"blue"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints -H "content-type: application/json" -d '{"restDeliveryPointName":"green"}'
~~~

## Queue Binding

/msgVpns/{msgVpnName}/restDeliveryPoints/{restDeliveryPointName}/queueBindings

msgVpnName
queueBindingName
postRequestTarget

~~~
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/queueBindings -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"green","postRequestTarget":"/"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/queueBindings -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"BB","restDeliveryPointName":"green","postRequestTarget":"/"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"AA","restDeliveryPointName":"blue","postRequestTarget":"/"}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/queueBindings  -H "content-type: application/json" -d '{"msgVpnName":"default","queueBindingName":"BB","restDeliveryPointName":"blue","postRequestTarget":"/"}'
~~~


## Rest Consumer

/msgVpns/{msgVpnName}/restDeliveryPoints/{restDeliveryPointName}/restConsumers

msgVpnName
restConsumerName
restDeliveryPointName
remoteHost
remotePort

~~~
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_a_green","restDeliveryPointName":"green","remoteHost":"192.168.56.51","remotePort":80, "tlsEnabled":false}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_b_green","restDeliveryPointName":"green","remoteHost":"192.168.56.51","remotePort":80, "tlsEnabled":false}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/green/restConsumers -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_c_green","restDeliveryPointName":"green","remoteHost":"192.168.56.51","remotePort":80, "tlsEnabled":false}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_a_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"192.168.56.51","remotePort":80, "tlsEnabled":false}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_b_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"192.168.56.51","remotePort":80, "tlsEnabled":false}'
curl -X POST -u admin:admin 192.168.56.51:8080/SEMP/v2/config/msgVpns/default/restDeliveryPoints/blue/restConsumers  -H "content-type: application/json" -d '{"msgVpnName":"default","restConsumerName":"scale_c_blue" ,"restDeliveryPointName":"blue" ,"remoteHost":"192.168.56.51","remotePort":80, "tlsEnabled":false}'
~~~
# Control commands

Activate a consumer
