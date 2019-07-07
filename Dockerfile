FROM alpine

ENV FRPS_VERSION=0.27.0

RUN FRPS_TAR=frp_${FRPS_VERSION}_linux_amd64.tar.gz && \
    FRPS_DIR=frp_${FRPS_VERSION}_linux_amd64 && \
    wget https://github.com/fatedier/frp/releases/download/v${FRPS_VERSION}/${FRPS_TAR} && \
    tar xzf ${FRPS_TAR} && \
    mv ${FRPS_DIR} /frps && \
    rm ${FRPS_TAR}

VOLUME /conf

ENTRYPOINT ["/frps/frps", "-c", "/conf/frps.ini"]
