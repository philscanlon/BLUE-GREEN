#!/bin/sh

echo "usage: functional_test.sh username password host port"
echo "Press [CTRL+C] to stop.."

echo TC001 - asterisk end of url
echo curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/*
curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/* \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="

echo TC002
echo curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/?time=1&thanks=2*
curl -X GET -u $1:$2 $3:$4/scale/v1/quotes-service/get-quotes/AA/?time=1&thanks=2* \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="


echo TC003  post transactions
echo curl -X POST -u $1:$2 $3:$4/scale/v1/transactions-service/post-transactions/AA
curl -X POST -u $1:$2 $3:$4/scale/v1/transactions-service/post-transactions/AA \
-d @TC003.json \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="


echo TC004 - report with : and - in URL
echo curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/reportid/dd-MM-yyyy/hh:mm/dd-MM-yyyy/hh:mm
curl -X GET -u $1:$2 $3:$4/scale/v1/reporting-service/get-report/AA/reportid/dd-MM-yyyy/hh:mm/dd-MM-yyyy/hh:mm \
-H "SCALE_TS: 1100110011000" \
-H "SCALE_TX_ID: TX1" \
-H "content-type: application/json" \
-H "SCALE_HMAC: B+e6j5PyfLmGDSqVS16uHCVAkxRgQaVI+kUKNqT5TIw="

"clientID": "XYZ","clientRequestID": "TX1-SCALE-TX-1OSAYT9H8EDKV", "status": "SUCCESS","rates":{

}"rateType": "TRADABLE", "rateQuoteID": "XYZ-1LX3XUS5K0GT9", "rateCategoryID": "CatA","validFrom": 1443150225448, "validTill": 1443323025448, "buyCurrency": "GBP","sellCurrency": "SGD","tenor": 2,"rate": 2.1395,"clientRateType": "RETAIL","status": "GOOD""rateType": "TRADABLE", "rateQuoteID": "XYZ-12QJL9EBI9FPK", "rateCategoryID": "CatA","validFrom": 1443150225448, "validTill": 1443323025448, "buyCurrency": "AUD", "sellCurrency": "MYR","tenor": 2,"rate": 3.2169,"clientRateType": "RETAIL","status": "GOOD"'
