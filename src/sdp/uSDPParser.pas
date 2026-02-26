unit uSDPParser;

{$mode objfpc} {$H+}

interface

uses SysUtils;

type
  TSDPInfo = record
    VideoControlURL: String;
    PayLoadType: Integer;
  end;

function ParseSDP(const SDPBody: String): TSDPInfo;

implementation

function ParseSDP(const SDPBody: String): TSDPInfo;
  var
  Lines: TArray<String>;
  Line: String;

  begin
    Result.PayLoadType := -1;
    Result.VideoControlURL := '';
    Lines := SDPBody.Split([#13#10, #10]);

    for Line in Lines do
      begin
        if Pos('m=video', Line) = 1 then
          Result.PayloadType := StrToIntDef(Trim(Copy(Line, LastDelimiter(' ', Line) + 1, 3)), 96)
        else if Pos('a=control:', Line) = 1 then
          Result.VideoControlURL := Copy(Line, 11, Length(Line));
      end;
    end;
end.
