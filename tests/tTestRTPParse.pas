
unit tTestRTPParse;
{$mode objfpc}{$H+}
interface
procedure RunRTPTest;
implementation
uses uRTPPacket, uLogger;

procedure RunRTPTest;
var
  DummyData: TBytes;
  Packet: TRTPPacket;
begin
  Log(llInfo, 'Running RTP Parse Test...');
  SetLength(DummyData, 14);
  DummyData[0] := $80; // V=2
  DummyData[1] := $60; // PT=96
  Packet := ParseRTP(DummyData);
  Log(llInfo, 'RTP Payload Type: ' + IntToStr(Packet.Header.M_PT and $7F));
end;
end.
