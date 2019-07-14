FROM arm64v8/alpine

ENV FRPS_VERSION=0.22.0
EXPOSE 7000

RUN FRPS_TAR=frp_${FRPS_VERSION}_linux_arm64.tar.gz && \
    FRPS_DIR=frp_${FRPS_VERSION}_linux_arm64 && \
    wget --no-check-certificate -q https://github.com/fatedier/frp/releases/download/v${FRPS_VERSION}/${FRPS_TAR} && \
    tar xzf ${FRPS_TAR} && \
    mv ${FRPS_DIR} /frps && \
    rm ${FRPS_TAR}

VOLUME /conf

ENTRYPOINT ["/frps/frps", "-c", "/conf/frps.ini"]
