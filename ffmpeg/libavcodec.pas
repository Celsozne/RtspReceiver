unit libavcodec;

{$mode objfpc}{$H+}

interface

uses libavutil;

const AV_CODEC_ID_H264 = 27;

type
  PAVCodec = Pointer;
  PAVCodecContext = Pointer;
  PAVPacket = Pointer;

function avcodec_find_decoder(id:Integer): PAVCodec; cdecl; external 'avcodec';

function avcodec_alloc_context3(codec: PAVCodec): PAVCodecContext; cdecl; external 'avcodec';

function avdocer_open2(avctx: PAVCodecContext, const codec: PAVCodec; option: PAVDictionary): Integer; cdecl; external 'avcodec';

function av_packet_alloc: PAVPacket; cdecl; external 'avcodec';

procedure av_packet_free(var pkt: PAVPacket); cdecl; external 'avcodec';

function avcodec_send_packet(avctx: PAVPacketContext; const avpkt: PAVPacket): Integer; cdecl; external 'avcodec';

function avcodec_receive_frame(avctx: PAVCodecContext; frame: PAVFrame): Integer; cdecl; external 'avcodec';

implementation

end.
