unit uTCPSocket;

{$mode objfpc}{$H+}

interface

uses SysUtils, Sockets, uLogger;

type
  TTCPSocket = class

  private

    FSocket: Integer;
    FConnected: Boolean;

  public
    constructor Create;
    destructor Destroy; override;
    function Connect(const IP: String; Port: Word): Boolean;
    function Send(const Data: String): Integer;
    function Receive(var Buffer: String; MaxLen: Integer): Integer;
    property Connected: Boolean read FConnected;
    procedure Close;



  end;

implementation

constructor TTCPSocket.Create;
begin
  FSocket := -1 ;
  FConnected := False;
end;

destructor TTCPSocket.Destroy;
begin
  Close;
  inherited;
end;

function TTCPSocket.Connect(const IP: String; Port: Word): Boolean;
var
  Addr: TInetSockAddr;
  begin
    if FSocket = -1 then Exit(False);
    Addr.sin_family :=AF_INET;
    Addr.sin_port := htons(Port);
    Addr.sin_addr := StrToNetAddr(IP);
    FConnected :=fpConnect (FSocket, @Addr, Sizeof(Addr)) = 0;
    Result := FConnected;
  end;

  function TTCPSocket.Receive(var Buffer: String; MaxLen: Integer): Integer;
  var TempBuff: array of  Byte;
  begin
    SetLength(TempBuff, MaxLen);
    Result := fpRecv(FSocket, @TempBuff[0], MaxLen, 0);
    if Result > 0 then
      begin
        SetString(Buffer,PChar(@TempBuff[0]), Result);
        end
    else
      Buffer := '';
  end;

  function TTCPSocket.Send(const Data: String): Integer;
  begin
    if not FConnected then Exit(-1);
      Result := fpSend(FSocket, PChar(Data), Length(Data), 0);
    end;
  procedure TTCPSocket.Close;
  begin
    if FSocket <> -1 then
      begin
        CloseSocket(FSocket);
        FSocket := -1;
        FConnected := False;
      end;
  end;
end.
