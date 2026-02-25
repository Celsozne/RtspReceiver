unit libavutil;

{$mode objfpc} {$H+}

interface

const
  AV_PIX_FMT_YUV420P = 0;
  AV_PIX_FMT_RGB24 = 2;

type
  PAVFrame = Pointer;
  PAVDictionary = Pointer;

function av_frame_alloc: PAVFrame; cdecl; external 'avutil';
procedure av_free_frame(var frame: PAVFrame); cdecl; external 'avutil';

implementation

end.
