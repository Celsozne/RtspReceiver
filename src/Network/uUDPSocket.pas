unit uUDPSocket;

{$mode objfpc}{$H+}

interface

uses SysUtils, Sockets, uLogger;

type
  TUDPSocket = class
  private
    FSocket: LongInt;
  public
    constructor Create;
    destructor Destroy; override;
    function Bind(Port: Word): Boolean;
    function Receive(var Buffer: TBytes; MaxLen: Integer): Integer;
    procedure Close;

  end;

implementation

constructor TUDPSocket.Create;
begin
  FSocket := fpSocket(AF_INET, SOCK_DGRAM, 0);
end;

destructor TUDPSocket.Destroy;
begin
  Close;
  inherited;
end;

function TUDPSocket.Bind(Port: Word): Boolean;
var Addr: TInetSockAddr;

begin
  Addr.sin_family := AF_INET;
  Addr.sin_port := htons(Port);
  Addr.sin_addr.s_addr := 0;
  Result := fpBind(FSocket, @Addr, Sizeof(Addr)) = 0;
end;

function TUDPSocket.Receive(var Buffer: TBytes; MaxLen: Integer): Integer;
begin
  SetLength(Buffer, MaxLen);
  Result := fpRecv(FSocket, @Buffer[0], MaxLen, 0);
  if Result >= 0 then SetLength(Buffer, Result);
end;

procedure TUDPSocket.Close;
begin
  if FSocket <> -1 then
  begin
    CloseSocket(FSocket);
    FSocket := -1;
  end;
end;
end.
