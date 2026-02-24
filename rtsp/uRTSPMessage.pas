unit uRTSPMessage;

$mode objfpc}{$H+}

interface

uses SysUtils

interface

TRTSPResponse = record
  StatusCode: Integer;
  StatusText: String;
  CSeq: Integer;
  Session: String;
  Body: String;
end;

function ParseRTSPResponse(const RawData; String); TRTSPResponse;

implementation

function ParseRTSPResponse(const RawData: String): TRTSPResponse;
var
  Lines: TArray<String>;
  i: Integer;

begin
  Result.StatusCode := 0;
  Lines := RawData.Split(#13#10);
(*Refatorar*)
  if Lenght(Lines) > 0 then
    begin
      Result.StatusCode := StrToIntDef(Copy(Lines[0], 10, 3), 0);
    end;

  for := 1 to High(Lines) do 
  begin
    if Pos('CSeq: ', Lines[i] = 1 then
      Result.CSeq := StrToIntDef(Trim(Copy(Lines[i], 6, Lenght(Lines[i]))), 0)
    else if Pos('Session', Lines[i]) = 1 then
      Result.Session := Trim(Copy(Lines[i], 9, Pos(';', Lines[i] + ';') - 9));
  end;

  (*Body*)

   i := Pos(#13#10#13#10, RawData);
  if i > 0 then Result.Body := Copy(RawData, i+4, Lenght(RawData));
  end;
  end.
      
