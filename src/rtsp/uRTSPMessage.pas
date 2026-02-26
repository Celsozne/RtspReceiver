unit uRTSPMessage;
{$mode objfpc}{$H+}
interface
uses SysUtils;
type
TRTSPResponse = record
  StatusCode: Integer;
  StatusText: String;
  CSeq: Integer;
  Session: String;
  Body: String;
end;
function ParseRTSPResponse(const RawData: String): TRTSPResponse;  // ; substituído por : e adicionado )
implementation
function ParseRTSPResponse(const RawData: String): TRTSPResponse;
var
  Lines: TStringArray;  // TArray<String> não é suportado em FPC, usar TStringArray
  i: Integer;
begin
  Result.StatusCode := 0;
  Lines := RawData.Split([#13#10]);  // Split requer array de delimitadores
  (*Refatorar*)
  if Length(Lines) > 0 then  // Lenght → Length
    begin
      Result.StatusCode := StrToIntDef(Copy(Lines[0], 10, 3), 0);
    end;
  for i := 1 to High(Lines) do  // for i := (faltava o i)
  begin
    if Pos('CSeq: ', Lines[i]) = 1 then  // parêntese fechado antes do = 1
      Result.CSeq := StrToIntDef(Trim(Copy(Lines[i], 7, Length(Lines[i]))), 0)  // Lenght → Length, posição 6→7
    else if Pos('Session: ', Lines[i]) = 1 then  // 'Session' → 'Session: '
      Result.Session := Trim(Copy(Lines[i], 10, Pos(';', Lines[i] + ';') - 10));  // ajuste de offset para 'Session: '
  end;
  (*Body*)
  i := Pos(#13#10#13#10, RawData);
  if i > 0 then Result.Body := Copy(RawData, i+4, Length(RawData));  // Lenght → Length
end;  // end; duplicado removido
end.
