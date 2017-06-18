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

create queue AA
permission all delete
subscription topic scale/*/*/*/AA/>
no shutdown
exit
create queue FY
permission all delete
subscription topic scale/*/*/*/FY/>
no shutdown
exit

! RDP BLUE
home
enable
configure
session timeout 0
message-vpn default
create rest rest-delivery-point blue
client-profile "default"
create queue-binding "AA"
post-request-target "/"
exit
create queue-binding "FY"
post-request-target "/"
exit

create rest-consumer "scale_a_blue"
authentication auth-scheme "none"
no authentication http-basic username
no local interface
remote host "10.198.37.53"
remote max-post-wait-time 30
remote outgoing-connection-count 3
remote port 1881
remote retry delay 3
no shutdown
exit

create rest-consumer "scale_b_blue"
authentication auth-scheme "none"
no authentication http-basic username
no local interface
remote host "10.198.37.53"
remote max-post-wait-time 30
remote outgoing-connection-count 3
remote port 1882
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
create rest rest-delivery-point green
client-profile "default"

!  create queue bindings
create rest-consumer "scale_a_green"
authentication auth-scheme "none"
no authentication http-basic username
no local interface
remote host "127.0.0.1"
remote max-post-wait-time 30
remote outgoing-connection-count 3
remote port 1882
remote retry delay 3
no shutdown
exit
no shutdown
exit

exit
exit
