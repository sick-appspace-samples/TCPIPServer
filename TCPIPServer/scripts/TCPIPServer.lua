--[[----------------------------------------------------------------------------

  Application Name: TCPIPServer

  Description:
  Creating TCP/IP Server.

  Script creates a TCPIPServer and wait for connections on port 2120. If new connections
  arrive, they are accepted and a greeting message is sent to them. The data on every
  connection is received and the length of the data is sent back.

  This sample can be tested using a TCP/IP client connection from any tool to the
  port 2345 and the localhost IP address "127.0.0.1". The server directly sends
  a greeting message framed with STX/ETX. Sending some data framed by STX/ETX to
  the server and should result in the server sending the length of the data back.

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

-- Create TCP/IP server instance
-- luacheck: globals gServer
gServer = TCPIPServer.create()
if not gServer then
  print('Could not create TCPIPServer')
end
TCPIPServer.setPort(gServer, 2120)
TCPIPServer.setFraming(gServer, '\02', '\03', '\02', '\03') -- STX/ETX framing for transmit and receive
TCPIPServer.register(gServer, 'OnConnectionAccepted', 'gHandleConnectionAccepted')
TCPIPServer.register(gServer, 'OnConnectionClosed', 'gHandleConnectionClosed')
TCPIPServer.register(gServer, 'OnReceive', 'gHandleReceive')
TCPIPServer.listen(gServer)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

-- Function is called when a new connection request is coming in
-- luacheck: globals gHandleConnectionAccepted
function gHandleConnectionAccepted(con)
  print('A connection is opened: ' .. con)
  -- Send hello to the connection. If want to, the connection could be stored for later usage.
  TCPIPServer.Connection.transmit(con, 'Hello')
end

-- Function is called when a connection is closed
-- luacheck: globals gHandleConnectionClosed
function gHandleConnectionClosed(con)
  print('A connection is closed: ' .. con)
end

-- Function is called when data is received
-- luacheck: globals gHandleReceive
function gHandleReceive(con, data)
  print('Received ' .. tostring(#data) .. ' bytes on con ' .. con)
  TCPIPServer.Connection.transmit(
    con,
    'You have sent ' .. tostring(#data) .. ' bytes'
  )
end

--End of Function and Event Scope------------------------------------------------
