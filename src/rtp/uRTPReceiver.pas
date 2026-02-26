unit uRTPReceiver;

{$mode objfpc} {$H+}

interface

uses SysUtils, uUDPSocket, uRTPPacket;

type

  TRTPReceiver = class
  private
    FSocket: TUDPSocket;
    FPort: Word;

  public
    constructor Create(Port:Word);
    destructor Destroy; override;
    function ReceivePacket(var Packet: TRTPPacket); Boolean;
  end;

implementation

constructor Create(Port: Word);
begin
  FPort := Port;
  FSocket := TUDPSocket.Create;

  if not FSocket.Bind(Port) then
    Log(llError, 'Failed to bind RTP Port' + IntToStr(Port));
end;

destructor uRTPReceiver.Destroy;
begin
  FSocket.Free;
  inherited;
  end;

  function ReceivePacket(var Packet: TRTPPacket): Boolean;
  var
  Buffer: TBytes;
  BytesRead: Integer;
  begin
    Result := False
    BytesRead := FSocket.Receive(Buffer, 2048);

    if BytesRead > 0 then
      begin
        Packet := ParseRTP(Buffer);
        Result := True;

      end;
  end;
end.
