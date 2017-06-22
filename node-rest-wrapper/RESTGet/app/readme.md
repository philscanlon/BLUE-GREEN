
Setup NODE-RED certificate & private key:

mkdir public
cd public
openssl genrsa -out privatekey.pem 1024
openssl req -new -key privatekey.pem -out private-csr.pem
openssl x509 -req -days 365 -in private-csr.pem -signkey privatekey.pem -out certificate.pem

Setup sample client certificate, private/public keys & PKCS #12 key format - for use by curl:

mkdir client
cd client
openssl req -x509 -newkey rsa:2048 -nodes -keyout client_priv_key.pem -out client_certificate.pem -days 365
openssl rsa -in client_priv_key.pem -pubout > client_pub_key.pem

# convert cert & priv key PEM to PKCS #12 format - you will be requested to set the password - remember this...
openssl pkcs12 -export -in client_certificate.pem -inkey client_priv_key.pem -out client_keystore.p12

Modify scb_settings_facade.js:

#uncomment
var fs = require("fs”);

#change the following code snippet
https: {
        key: fs.readFileSync('public/privatekey.pem'),
        cert: fs.readFileSync('public/certificate.pem'),
        ca: fs.readFileSync('public/client/client_certificate.pem'),
        requestCert: true,
        rejectUnauthorized: true
},

Sample sub_settings_facade.js attached below:


Test using curl:

curl -k -vvvv -X GET --cert client_keystore.p12:<your password> https://192.168.88.131:1880/scale/a/b/c/AA -H "content-type: application/json" -H "SCALE_HMAC: Uowo1JlSgBm1fsROx2ubBF+49Acu7DzAeUxS1u9F8Fo=“

NOTE: if running on MAC OSX, you will need to add public/certificate.pem & public/client/client_certificate.pem to your KeyChain Certificates, else curl will return an error something like this "curl: (35) error reading X.509 potentially-encrypted key file: Error in parsing”. This is a known MAC OSX issue.


Just a reminder, you must set public/certificate.pem & public/client/client_certificate.pem in Keychain as “Always Trusted” - make sure you see the + icon next to the certificates in Keychain GUI.

Note, remove the -k option of curl to ensure curl will validate the certificate presented by node-red such as:

curl -vvvv -X GET --cert client_keystore.p12:<your password> https://192.168.88.131:1880/scale/a/b/c/AA -H "content-type: application/json" -H "SCALE_HMAC: Uowo1JlSgBm1fsROx2ubBF+49Acu7DzAeUxS1u9F8Fo=“

Use below for curl not to send the client certificate (you should see an authentication error as expected):

curl -vvvv -X GET https://192.168.88.131:1880/scale/a/b/c/AA -H "content-type: application/json" -H "SCALE_HMAC: Uowo1JlSgBm1fsROx2ubBF+49Acu7DzAeUxS1u9F8Fo=“
