#!/bin/sh

echo "usage: functional_test.sh username password host port"
echo "Press [CTRL+C] to stop.."
echo
echo ==================================================================================
echo TC001 - asterisk end of url
echo curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/*
echo ==================================================================================
curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/* \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="

echo
echo ==================================================================================
echo TC002
echo curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/?a=1
echo ==================================================================================
curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA?a=1 \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="

echo
echo ==================================================================================
echo TC003  post transactions
echo curl -X POST -u $1:$2 $3:$4/scale/v1/transactions-service/post-transactions/AA -d @TC003.json
echo ==================================================================================
curl -X POST -u $1:$2 $3:$4/scale/v1/transactions-service/post-transactions/AA -d @TC003.json \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="


echo
echo ==================================================================================
echo TC004 - report with : and - in URL
echo curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/reportid/dd-MM-yyyy/hh:mm/dd-MM-yyyy/hh:mm
echo ==================================================================================
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/reportid/dd-MM-yyyy/hh:mm/dd-MM-yyyy/hh:mm \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="
