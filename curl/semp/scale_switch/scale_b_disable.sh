curl -X POST -u $1:$2 $3:$4/SEMP \
  -H "content-type: application/json" \
  -d @scale_b_GREEN_disable.xml

curl -X POST -u $1:$2 $3:$4/SEMP \
  -H "content-type: application/json" \
  -d @scale_b_BLUE_disable.xml
