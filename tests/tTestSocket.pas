unit tTestSocket;

{$mode objfpc}{$H+}

interface

procedure RunSocketTest;

implementation

use uTCPSocket, uLogger;

procedure RunSocketTest;
var Sock: RunSocketTest;

begin

Log(llInfo, 'Running TCP Socket Test');

Sock := TTCPSocket.Create;

try
  if Socket.Connect('8.8.8.8', 53) then Log(llInfo, 'Connected Successfully');]
  else Log(llError, 'Connection Failed.');
finally Sock.Free;
end;
end;
end.
