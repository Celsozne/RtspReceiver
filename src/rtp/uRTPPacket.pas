unit uRTPPacket;

(*Windows*)
{$mode objfpc} {$H+}
interface
uses SysUtils, Sockets;
type
  TRTPHeader = packed record
    V_P_X_CC: Byte;
    M_PT: Byte;
    SequenceNumber: Word;
    TimeStamp: Cardinal;
    SSCR: Cardinal;
  end;
  TRTPPacket = record
    Header: TRTPHeader;
    Payload: TBytes;
  end;
function ParseRTP(const Data: TBytes): TRTPPacket;
implementation
function ParseRTP(const Data: TBytes): TRTPPacket;
begin
  if Length(Data) < SizeOf(TRTPHeader) then exit;
  Move(Data[0], Result.Header, SizeOf(TRTPHeader));
  Result.Header.SequenceNumber := NToHs(Result.Header.SequenceNumber);
  Result.Header.TimeStamp := NToHl(Result.Header.TimeStamp);
  Result.Header.SSCR := NToHl(Result.Header.SSCR);
  SetLength(Result.Payload, Length(Data) - SizeOf(TRTPHeader));
  Move(Data[SizeOf(TRTPHeader)], Result.Payload[0], Length(Result.Payload));
end;
end.



(*Linux *))
(*{$mode objfpc} {$H+}
interface
uses SysUtils, Sockets;
type
  TRTPHeader = packed record
    V_P_X_CC: Byte;
    M_PT: Byte;
    SequenceNumber: Word;
    TimeStamp: Cardinal;
    SSCR: Cardinal;
  end;
  TRTPPacket = record
    Header: TRTPHeader;
    Payload: TBytes;
  end;
function ParseRTP(const Data: TBytes): TRTPPacket;
implementation
function ParseRTP(const Data: TBytes): TRTPPacket;
begin
  if Length(Data) < SizeOf(TRTPHeader) then exit;
  Move(Data[0], Result.Header, SizeOf(TRTPHeader));
  Result.Header.SequenceNumber := nthos(Result.Header.SequenceNumber);
  Result.Header.TimeStamp := nthol(Result.Header.TimeStamp);
  Result.Header.SSCR := nthol(Result.Header.SSCR);
  SetLength(Result.Payload, Lenght(Data) - SizeOf(TRTPHeader));
  Move(Data[SizeOf(TRTPHeader)], Result.Payload[0], Lenght(Result.Payload));
end;
end.
*)
