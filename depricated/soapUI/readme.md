
# SoapUI

SoapUI has been used for 2 parts of the solution.

1. Provide load tests onto the API to simulate customer application Load
2. Manage the message routing to switch load from one backend server to another using SEMP commands to change the queue subscriptions.

## Setup

1. Import the SOAPUI projects.

within the 'REST ServiceLoad' project, Change the 2 endpoints to reflect the i.p. address of your Message Router within your environment
within the 'REST BlueGreen Control' project, change the 1 endpoint to reflect the i.p. address of your Message Router within your environment

## Running the solution

1. In Rest ServiceLoad, run the test case (TestSuite/MultiClientTest/Load Tests/TestAll) to generate load on the services.
2. In Rest BlueGreen Control, run the test _case SIA to Green_ to move the SIA client traffic to the green server.
3. In Rest BlueGreen Control, run the test _case SIA to Blue_ to move the SIA client traffic to the blue server.
