unit tTestRTSP;
{$mode objfpc}{$H+}
interface

procedure runRTSPTest;

implementation

uses uRTSPClient, uSDPParser, uLogger;

procedure runRTSPTest;
var
  Client: TRTSPClient;
  SDP: TSDPInfo;

begin
log(llInfo, 'Running RTSP Handshake test');
Client := TRTSPClient.Create;

try
  if Client.Connect('192.168.1.100', 554, 'rtsp://192.168.1.100/stream1') then
      begin
        if Client.DoDescribe(SDP) then Log(llInfo, 'DESCRIBE OK');

      end;
      finally
        Client.Free;
end;

end;
end.
