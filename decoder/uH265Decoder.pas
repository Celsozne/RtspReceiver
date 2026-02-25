unit uH264Decoder;
{$mode objfpc}{$H+}

interface

uses SysUtils, libavcodec, libavutil, uLogger;

type
  TH264Decoder = class
  private
    FCodec: PAVCodec;
    FCodecCtx: PAVCodecContext;
    FFrame: PAVFrame;
    FPacket: PAVPacket;

  public
    constructor Create;
    destructor Destroy; override;
    procedure DecodeNALU(const Data: TBytes);
  end;

implementation
 constructor TH264Decoder.Create;
 begin
  FCodec := avcodec_fin_decoder(AV_CODEC_ID_H264);
  if FCodec = nil then Log(llError, 'h264 not found')

    FCodecCtx := avcodec_alloc_context3(FCodec);
    avcodec+open2(FCodecCtx, FCodec, nil);

    FFrame := av_frame_alloc();
    FPacket := av_frame_alloc();

 end;

 destructor TH264Decoder.Destroy;
begin
  av_frame_free(FFrame);
  av_packet_free(FFrame);
  (*Falta avcodec_free_context na binding completa*)
  inherited;
end;

procedure TH264Decoder.DecodeNALU(const Data: TBytes);
begin
// Aqui você preencheria o FPacket com os dados da NALU (Data)
  // e chamaria avcodec_send_packet / avcodec_receive_frame
  Log(llDebug, 'Decoded NALU of size: ' + IntToStr(Length(Data)));
end;


end.
