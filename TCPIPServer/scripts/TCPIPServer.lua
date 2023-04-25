
--Start of Global Scope---------------------------------------------------------

-- Create TCP/IP server instance
Server = TCPIPServer.create()
if not Server then
  print('Could not create TCPIPServer')
end
TCPIPServer.setPort(Server, 2120)
TCPIPServer.setFraming(Server, '\02', '\03', '\02', '\03') -- STX/ETX framing for transmit and receive
TCPIPServer.listen(Server)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

--- Function is called when a new connection request is coming in
---@param con TCPIPServer.Connection
local function handleConnectionAccepted(con)
  print('A connection is opened: ' .. con)
  -- Send hello to the connection. If want to, the connection could be stored for later usage.
  TCPIPServer.Connection.transmit(con, 'Hello')
end
TCPIPServer.register(Server, 'OnConnectionAccepted', handleConnectionAccepted) -- fixed: register below the function

--- Function is called when a connection is closed
---@param con TCPIPServer.Connection
local function handleConnectionClosed(con)
  print('A connection is closed: ' .. con)
end
TCPIPServer.register(Server, 'OnConnectionClosed', handleConnectionClosed)

--- Function is called when data is received
---@param con TCPIPServer.Connection
---@param data binary
local function handleReceive(con, data)
  print('Received ' .. tostring(#data) .. ' bytes on con ' .. con)
  TCPIPServer.Connection.transmit(
    con,
    'You have sent ' .. tostring(#data) .. ' bytes'
  )
end
TCPIPServer.register(Server, 'OnReceive', handleReceive)

--End of Function and Event Scope------------------------------------------------
