unit uRTSPCommands;

{$mode objfpc} {$H+}

interface
uses SysUtils;

function BuildDescribe(const URL: String; CSeq: Integer): String;

function BuildSetup(const URL: String; CSeq: Integer; ClientPort: Word): String;

function BuildPlay(const URL, Session: String; CSeq: Integer): String;

implementation
(*Só refatorar essa merda*)
function BuildDescribe(const URL: String; CSeq: Integer): String;
begin
  Result := Format('DESCRIBE %s RTSP/1.0'#13#10 +
                   'CSeq: %d'#13#10 +
                   'Accept: application/sdp'#13#10#13#10, [URL, CSeq]);
end;

function BuildSetup(const URL: String; CSeq: Integer; ClientPort: Word): String;
begin
  Result := Format('SETUP %s RTSP/1.0'#13#10 +
                   'CSeq: %d'#13#10 +
                   'Transport: RTP/AVP;unicast;client_port=%d-%d'#13#10#13#10,
                   [URL, CSeq, ClientPort, ClientPort + 1]);
end;

function BuildPlay(const URL, Session: String; CSeq: Integer): String;
begin
  Result := Format('PLAY %s RTSP/1.0'#13#10 +
                   'CSeq: %d'#13#10 +
                   'Session: %s'#13#10#13#10, [URL, CSeq, Session]);

end;

end.
