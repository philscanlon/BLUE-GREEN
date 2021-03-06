clear
echo
echo '--------------------------------------------------'
echo '-  queue message count'
echo '-  '
echo '-  if num-messages-spooled is > 0'
echo '-  messages are not being delivered to an endpoint'
echo '--------------------------------------------------'
curl -X POST -u $1:$2 $3:$4/SEMP \
-H "content-type: application/json" \
-d @queue_message_count.xml

echo
echo '--------------------------------------------------'
echo '-  rest_consumers'
echo '-  '
echo '-  operating-state should be Up'
echo '-  '
echo '--------------------------------------------------'
curl -X POST -u $1:$2 $3:$4/SEMP \
-H "content-type: application/json" \
-d @rest_consumers.xml


echo
echo '--------------------------------------------------'
echo '-  REST Delivery Points'
echo '-  '
echo '-  '
echo '-  '
echo '--------------------------------------------------'
curl -X POST -u $1:$2 $3:$4/SEMP \
-H "content-type: application/json" \
-d @rest_delivery_points.xml

echo
echo '--------------------------------------------------'
echo '-  Queue Bindings'
echo '-  '
echo '-  operating-state should be Up'
echo '-  '
echo '--------------------------------------------------'
curl -X POST -u $1:$2 $3:$4/SEMP \
-H "content-type: application/json" \
-d @queue_bindings.xml
