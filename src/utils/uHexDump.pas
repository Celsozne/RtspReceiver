unit uHexDump;
{$mode objfpc}{$H+}

interface

uses SysUtils;

procedure HexDump(const Data: TBytes; Lenght: Integer);

implementation

procedure HexDump(const Data: TBytes; Lenght: Integer);
var
  i: Integer;
  Line: String;
begin
  Line := '';
  for i := 0 to (Lenght - 1) do
    begin
      Line := Line + IntToHex(Data[i], 2) + ' ';
      if ((i + 1) mod 16 = 0) or (i = Lenght- 1) then
      begin
        Writeln(Line);
        Line := '';
    end;
end;
end;
end.
