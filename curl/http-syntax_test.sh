#!/bin/sh

echo "usage: http-syntax_test.sh username password host port"

echo safe
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/$/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/-/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/_/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/./

echo extra

curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/!
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/*
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/(
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/)
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/,
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/'

curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/!/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/*/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/(/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/)/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/,/
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/'/
