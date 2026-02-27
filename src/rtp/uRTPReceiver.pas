unit uRTPReceiver;

{$mode objfpc} {$H+}

interface

uses SysUtils, uUDPSocket, uRTPPacket, uLogger;

type

  TRTPReceiver = class
  private
    FSocket: TUDPSocket;
    FPort: Word;

  public
    constructor Create(Port: Word);
    destructor Destroy;
    function ReceivePacket(var Packet: TRTPPacket): Boolean;
  end;

implementation

constructor TRTPReceiver.Create(Port: Word);
begin
  FPort := Port;
  FSocket := TUDPSocket.Create;

  if not FSocket.Bind(Port) then
    Log(llError, 'Failed to bind RTP Port ' + IntToStr(Port));
end;

destructor TRTPReceiver.Destroy;
begin
  FSocket.Free;
  inherited;
  end;

  function TRTPReceiver.ReceivePacket(var Packet: TRTPPacket): Boolean;
  var
  Buffer: TBytes;
  BytesRead: Integer;
  begin
    Result := False;
    BytesRead := FSocket.Receive(Buffer, 2048);

    if BytesRead > 0 then
      begin
        Packet := ParseRTP(Buffer);
        Result := True;

      end;
  end;
end.
