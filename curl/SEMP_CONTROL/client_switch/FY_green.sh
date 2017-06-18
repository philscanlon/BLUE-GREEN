
curl -X POST -u $1:$2 $3:$4/SEMP \
     -H "content-type: application/json" \
     -d @FY_QueueBinding_GREEN.xml

curl -X POST -u $1:$2 $3:$4/SEMP \
     -H "content-type: application/json" \
     -d @FY_QueueBinding_GREEN_ep.xml

curl -X POST -u $1:$2 $3:$4/SEMP \
     -H "content-type: application/json" \
     -d @FY_QueueBinding_BLUE_delete.xml
