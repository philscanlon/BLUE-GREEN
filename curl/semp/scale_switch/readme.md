
These scripts will change one of the back end servers from green to blue and vice versa.

Script parameters:

$1 username
$2 password
$3 hostname/ip
$4 port

example command:

# Make SCALE a node a 'blue node'

## Disable the node so it no longer receives traffic

./scale_a_disable.sh admin admin 192.168.56.51 8080

Make the changes to the deployment on the scale server so it is at the new version

## Enable the node (as blue) so it now processing traffic

./scale_a_blue.sh admin admin 192.168.56.51 8080
