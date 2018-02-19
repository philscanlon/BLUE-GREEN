#!/bin/sh

echo "usage: basic_load.sh username password host port"
echo "Press [CTRL+C] to stop.."

while :
do
curl -X GET -u $1:$2 $3:$4/scale/a/b/c/AA \
     -H "content-type: application/json" \
     -H "SCALE_HMAC: Uowo1JlSgBm1fsROx2ubBF+49Acu7DzAeUxS1u9F8Fo="  
# > basic_load.log 2>&1
 curl -X GET -u $1:$2 $3:$4/scale/a/b/c/FY \
    -H "content-type: application/json" \
    -H "SCALE_HMAC: Uowo1JlSgBm1fsROx2ubBF+49Acu7DzAeUxS1u9F8Fo="
#  sleep 1
done
