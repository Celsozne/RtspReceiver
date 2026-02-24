RTSPLearner/
│
├── src/
│   ├── network/
│   │   ├── uTCPSocket.pas        # Socket TCP cru (sem Indy/Synapse)
│   │   └── uUDPSocket.pas        # Socket UDP para receber RTP
│   │
│   ├── rtsp/
│   │   ├── uRTSPMessage.pas      # Estrutura de Request/Response RTSP
│   │   ├── uRTSPCommands.pas     # DESCRIBE, SETUP, PLAY, TEARDOWN
│   │   └── uRTSPClient.pas       # Orquestra o handshake completo
│   │
│   ├── sdp/
│   │   └── uSDPParser.pas        # Parseia o corpo do DESCRIBE
│   │
│   ├── rtp/
│   │   ├── uRTPPacket.pas        # Struct do header RTP + parser
│   │   └── uRTPReceiver.pas      # Loop de recepção UDP
│   │
│   ├── ffmpeg/
│   │   ├── libavcodec.pas        # Binding: decodificação
│   │   ├── libavformat.pas       # Binding: containers/demux
│   │   ├── libavutil.pas         # Binding: utilitários
│   │   └── libswscale.pas        # Binding: conversão de pixel format
│   │
│   ├── decoder/
│   │   └── uH264Decoder.pas      # Usa FFmpeg para decodificar NAL units
│   │
│   └── utils/
│       ├── uLogger.pas           # Log detalhado de cada etapa
│       └── uHexDump.pas          # Dump hex dos pacotes (essencial p/ debug)
│
├── tests/
│   ├── tTestSocket.pas           # Testa conexão TCP
│   ├── tTestRTSP.pas             # Testa handshake isolado
│   └── tTestRTPParse.pas         # Testa parser de pacote RTP
