
# Compila o projeto apontando os caminhos de busca (-Fu)
fpc -Mobjfpc -Sh -B -FEbin -Fusrc/utils -Fusrc/network -Fusrc/rtsp -Fusrc/sdp -Fusrc/rtp -Fusrc/ffmpeg -Fusrc/decoder -Futests RTSPLearner.lpr
