unit uRTSPClient;
{$mode objfpc}{$H+}

interface

uses SysUtils, uTCPSocket, uRTSPMessage, uRTSPCommands, uSDPParser, uLogger;

type

  TRTSPClient = class
    private
      FTCP: TTCPSocket;
      FURL: String;
      FCSeq: Integer;
      FSession: String;

    public
      constructor Create;
      destructor Destroy; override;
      function Connect(const IP, URL: String; Port: Word): Boolean;
      function DoDescribe(out SDP: TSDPInfo): Boolean;
      function DoSetup(const ControlURL: String; ClientPort: Word): Boolean;
      function DoPlay: Boolean;
  end;

implementation

constructor TRTSPClient.Create;
begin
  FTCP := TTCPSocket.Create;
  FCSeq := 1;
end;

destructor TRTSPClient.Destroy;
  begin
  FTCP.Free;
  inheried;
  end;

  function TRTSPClient.Connect(const IP, URL: String; Port: Word): Boolean;
    begin
      FURL := URL;
      Result := FTCP.Connect(IP, Port);
    end;

  function TRTSPClient.DoDescribe(out SDP: TSDPInfo): Boolean;

    var
      Req, RespStr: String;
      Resp: TRTSPResponse;
      begin
        Req := BuildDescribe(FURL, FCSeq);
        FTCP.Send(Req);
        FTCP.Receive(RespStr, 4096);
        Resp := ParseRTSPResponse(RespStr);

        if Resp.StatusCode = 200 then
          begin
            SDO := ParseSDP(Resp.Body);
            Inc(FCSeq);
            Exit(True)
          end;
        Result := False;

      end;

  function TRTSPClient.DoSetup(const ControlURL: String; ClientPort: Word): Boolean;
  var
    Req, RespStr: String;
    Resp: TRTSPResponse;
  begin
    Req := BuildSetup(ControlURL, FCSeq, ClientPort);
    FTCP.Send(Req);
    FTCP.Receive(RespStr, 4096);
    Resp := ParseRTSPResponse(RespStr);

    if Resp.StatusCode = 200 then
      begin
        FSession := Respo.Session;
        Inc(FCSeq);
        Exit(True);
      end;
      Result := False;
  end;

  function TRTSPClient.DoPlay: Boolean;
  var
    Req, RespStr: String;
    Resp: TRTSPResponse;
  begin
    Req := BuildPlay(FURL, FSession, FCSeq);
    FTCP.Send(Req);
    FTCP.Receive(RespStr, 4096);
    Resp := ParseRTSPResponse(RespStr);
    Resul := Resp.StatusCode = 200
  end;
  end.
