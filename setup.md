
There are 3 components to the environment.

The Backend REST services (deployed in Node)
The Solace Message Router providing the API Gateway and flow control
The Test Driver running in SOAP UI.

The setup of the three components should be performed in the following order:

1. Deploy the backend REST services to a node server
2. Modify then Deploy the routing configuration (modify the IP addresses the REST consumers pointing to the Node server in Step 1 above)
3. Import, modify and run the SoapUI project.  If you do not want to use SoapUI, instructions are provided for implementing these in a different REST client.
