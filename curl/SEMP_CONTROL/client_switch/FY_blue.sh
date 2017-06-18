
curl -X POST -u $1:$2 $3:$4/SEMP \
     -H "content-type: application/json" \
     -d @FY_QueueBinding_BLUE.xml

curl -X POST -u $1:$2 $3:$4/SEMP \
     -H "content-type: application/json" \
     -d @FY_QueueBinding_BLUE_ep.xml

curl -X POST -u $1:$2 $3:$4/SEMP \
     -H "content-type: application/json" \
     -d @FY_QueueBinding_GREEN_delete.xml
