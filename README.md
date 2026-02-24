# RtspReceiver

RTSP_Server_Project/
│
├── src/
│   └── MainApp.pas                    # Ponto de entrada, inicializa servidor
│
├── Modules/
│   │
│   ├── RtspProtocol/
│   │   ├── RtspProtocol.pas           # Orquestrador do protocolo RTSP
│   │   ├── RtspParser.pas             # Parse de requisições RTSP
│   │   ├── RtspSession.pas            # Controle de sessão por cliente
│   │   ├── RtspMessages.pas           # Tipos e estruturas de mensagens
│   │   ├── RtspConstants.pas          # Constantes (métodos, status codes)
│   │   └── SdpBuilder.pas             # Montagem do SDP para DESCRIBE
│   │
│   ├── RtpStream/
│   │   ├── RtpPacketizer.pas          # Empacotamento RTP (RFC 3550)
│   │   ├── RtpSessionContext.pas      # Contexto de sessão RTP por cliente
│   │   ├── RtpSender.pas              # Envio UDP/TCP dos pacotes RTP
│   │   └── RtpTypes.pas               # Tipos base RTP
│   │
│   └── MediaHandler/
│       ├── FFmpegBridge.pas           # Wrapper Pascal → libavformat/libavcodec
│       ├── MediaDemuxer.pas           # Demux de container (MP4, MKV, etc)
│       ├── VideoEncoder.pas           # Reencoding/passthrough H.264
│       ├── AudioManager.pas           # Gerenciamento de faixas de áudio
│       ├── CodecRegistry.pas          # Registro de codecs suportados
│       └── MediaTypes.pas             # Tipos compartilhados de mídia
│
├── Network/
│   ├── TcpServer.pas                  # Servidor TCP principal (porta 554)
│   ├── SocketHandler.pas              # Handler de conexão por cliente
│   ├── UdpSender.pas                  # Envio RTP via UDP
│   └── NetworkTypes.pas               # Tipos de rede compartilhados
│
├── Utils/
│   ├── Logger.pas                     # Log centralizado com níveis
│   ├── ConfigLoader.pas               # Leitura do server.ini
│   ├── ThreadPool.pas                 # Pool de threads para clientes
│   └── TimeUtils.pas                  # Timestamps NTP/RTP
│
├── tests/
│   ├── TestRunner.pas                 # Runner central de testes
│   ├── TestRtspProtocol.pas           # Testes do parser e sessão
│   ├── TestRtpStream.pas              # Testes de empacotamento RTP
│   └── TestMediaHandler.pas          # Testes do bridge FFmpeg
│
├── config/
│   └── server.ini                     # Porta, paths, bitrate, codec
│
├── media/
│   └── sample.mp4                     # Arquivo de teste
│
├── docs/
│   └── Architecture.md                # Documentação da arquitetura
│
└── RTSP_Server_Project.lpr            # Projeto Lazarus
