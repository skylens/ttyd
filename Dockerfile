FROM ubuntu:20.04

ARG TARGETARCH
COPY ./dist/${TARGETARCH}/ttyd /usr/bin/ttyd
RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

EXPOSE 7681
WORKDIR /root

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["ttyd", "-t enableZmodem=true -t enableTrzsz=true -t enableSixel=true -t cursorStyle=bar -t enableTrzsz=true -t fontSize=20", "bash"]
