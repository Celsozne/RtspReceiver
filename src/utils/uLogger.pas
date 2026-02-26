unit uLogger;

{$mode objfpc}{$H+}

interface

uses SysUtils;

type
  TLogLevel = (llInfo, llWarning, llError, llDebug);

procedure Log(Level: TLogLevel; const Msg: String);

implementation

procedure Log(Level: TLogLevel; const Msg: String);
const
  LevelStr: array[TLogLevel] of String = ('INFO', 'WARN', 'ERROR', 'DEBUG');
var
  utime: String;
begin
  utime := FormatDateTime('hh:nn:ss.zzz', Now);

  Writeln(Format('[%s] %s %s',[utime, LevelStr[Level], Msg]));
end;

end.
