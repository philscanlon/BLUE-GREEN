curl -X POST -u $1:$2 $3:$4/SEMP \
  -H "content-type: application/json" \
  -d @scale_a_GREEN_enable.xml
