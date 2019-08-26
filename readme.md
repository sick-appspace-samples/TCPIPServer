## TCPIPServer
Creating and using TCP/IP server
### Description
Script creates a TCPIPServer and wait for connections on port 2120. If new connections
arrive, they are accepted and a greeting message is sent to them. The data on every
connection is received and the length of the data is sent back.  
### How to Run
This sample can be tested using a TCP/IP client connection from any tool to the
port 2120 and the localhost IP address "127.0.0.1". The server directly sends
a greeting message framed with STX/ETX. Sending some data framed by STX/ETX to
the server and should result in the server sending the length of the data back

### Topics
System, Communication, Sample, SICK-AppSpace