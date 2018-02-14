


~~~
curl -X POST -u admin:admin 192.168.56.1:1880/scale/a/b/c/AA/test \
  -H "content-type: application/json" \
  -d '{"test" :"default","test":"AA"}'
~~~

curl -X GET -u admin:admin 127.0.0.1:1880/scale/a/b/c/AA/test  -H "content-type: application/json"

curl -X GET -u admin:admin localhost:9000/scale/a/b/c/AA/test  -H "content-type: application/json"

http://uklvadapp155.uk:1881

curl -X GET -u admin:admin 127.0.0.1:9000/scale/a/b/c/AA  -H "content-type: application/json"  -H "SCALE_HMAC: Uowo1JlSgBm1fsROx2ubBF+49Acu7DzAeUxS1u9F8Fo="
