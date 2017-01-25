home
enable
configure
session timeout 0
message-vpn default


!  VPN
!  ===
!  Use default

!  REST Config
!  ===========
!  Enabled on VMR by default on port 9000

!  Queue's
!  =======
home
enable
configure
message-spool message-vpn default

create queue v1/quote-service/get-FX-rate/SIA/gbp/sgd
permission all delete
no shutdown
exit
create queue v1/quote-service/get-FX-rate/QANTAS/sgd/aud
permission all delete
no shutdown
exit
create queue v1/quote-service/get-FX-rate/TIGER/thb/sgd
permission all delete
no shutdown
exit
create queue v1/quote-service/get-FX-rate/AIRASIA/myr/sgd
permission all delete
no shutdown
exit

! RDP BLUE
home
enable
configure
session timeout 0
message-vpn default
create rest rest-delivery-point rdp-blue
client-profile "default"
create queue-binding "v1/quote-service/get-FX-rate/SIA/gbp/sgd"
post-request-target "/v1/quote-service/get-FX-rate"
exit
create queue-binding "v1/quote-service/get-FX-rate/QANTAS/sgd/aud"
post-request-target "/v1/quote-service/get-FX-rate"
exit
create queue-binding "v1/quote-service/get-FX-rate/TIGER/thb/sgd"
post-request-target "/v1/quote-service/get-FX-rate"
exit
create queue-binding "v1/quote-service/get-FX-rate/AIRASIA/myr/sgd"
post-request-target "/v1/quote-service/get-FX-rate"
exit
create rest-consumer "blueConsumer"
authentication auth-scheme "none"
no authentication http-basic username
no local interface
remote host "192.168.56.1"
remote max-post-wait-time 30
remote outgoing-connection-count 3
remote port 1880
remote retry delay 3
no shutdown
exit
no shutdown
exit

!  RDP GREEN
home
enable
configure
session timeout 0
message-vpn default
create rest rest-delivery-point rdp-green
client-profile "default"
!  create queue bindings
create rest-consumer "greenConsumer"
authentication auth-scheme "none"
no authentication http-basic username
no local interface
remote host "192.168.56.1"
remote max-post-wait-time 30
remote outgoing-connection-count 3
remote port 1880
remote retry delay 3
no shutdown
exit
no shutdown
exit

exit
exit
