# SEMP commands

SEMP is used to manage router configuration.  The commands are included in the SoapUI project, but are also duplicated here for completeness, or if you would like to run the sample without using SoapUI.

Currently the commands in this project are SEMP v1.

The SEMP commands are used to route the traffic for the SIA URL from blue to green.

# API Calls

The payload of the message is not important for the API call.  
The URL of the query is used to determine which backend service a message is routed to.

If SoapUI project is not used, then the following can be used in your favourite REST client:

The following 4 URL's are implemented for the demo:

http://[SolaceRouter]:9000/QUEUE/v1/quote-service/get-FX-rate/SIA/gbp/sgd
http://[SolaceRouter]:9000/QUEUE/v1/quote-service/get-FX-rate/AIRASIA/myr/sgd
http://[SolaceRouter]:9000/QUEUE/v1/quote-service/get-FX-rate/TIGER/thb/sgd
http://[SolaceRouter]:9000/QUEUE/v1/quote-service/get-FX-rate/TIGER/thb/sgd

The Method in POST
to support waiting for a response, the following should be added as a message header:

Solace-Reply-Wait-Time-In-ms   3000
