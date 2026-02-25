
program RTSPLearner;
{$mode objfpc}{$H+}

uses
  SysUtils,
  uLogger in 'src/utils/uLogger.pas',
  uHexDump in 'src/utils/uHexDump.pas',
  uTCPSocket in 'src/network/uTCPSocket.pas',
  uUDPSocket in 'src/network/uUDPSocket.pas',
  uRTSPMessage in 'src/rtsp/uRTSPMessage.pas',
  uRTSPCommands in 'src/rtsp/uRTSPCommands.pas',
  uSDPParser in 'src/sdp/uSDPParser.pas',
  uRTPPacket in 'src/rtp/uRTPPacket.pas',
  uRTPReceiver in 'src/rtp/uRTPReceiver.pas',
  uRTSPClient in 'src/rtsp/uRTSPClient.pas',
  libavutil in 'src/ffmpeg/libavutil.pas',
  libavcodec in 'src/ffmpeg/libavcodec.pas',
  libavformat in 'src/ffmpeg/libavformat.pas',
  libswscale in 'src/ffmpeg/libswscale.pas',
  uH264Decoder in 'src/decoder/uH264Decoder.pas',
  tTestSocket in 'tests/tTestSocket.pas',
  tTestRTSP in 'tests/tTestRTSP.pas',
  tTestRTPParse in 'tests/tTestRTPParse.pas';

begin
  Log(llInfo, 'Starting RTSPLearner...');

  // Descomente para rodar os testes
  // RunSocketTest;
  // RunRTPTest;
  // RunRTSPTest;

  Log(llInfo, 'Application finished.');
end.
