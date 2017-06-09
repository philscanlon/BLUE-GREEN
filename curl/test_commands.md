


~~~
curl -X POST -u user:password solacevmr:9000/scale/a/b/c/AA \
  -H "content-type: application/json"
  -H "" \
  -d '{"test" :"default","test":"AA"}'
~~~

curl -X GET -u admin:admin 192.168.56.1:1880/scale/a/b/c/AA  -H "content-type: application/json" 
