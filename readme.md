## TCPIPServer

Creating and using a TCP/IP server

### Description

The Script creates a TCPIPServer and waits for incoming connections on port 2120.
New connections are accepted and a greeting message is sent to them.
Data send to the server must be wraped in STX/ETX framings in order to be processed correctly.
The length of every received data payload is being sent back to the according client.

### How to Run

For using the sample a TCP client must be installed.
The client must be configured to connect to the localhost IP address "127.0.0.1" on port 2120 .
The server directly sends a greeting message framed with STX/ETX.

### Topics

system, communication, sample, sick-appspace