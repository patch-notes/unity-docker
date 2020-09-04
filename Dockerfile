FROM ubuntu:16.04

ENV UNITY_DOWNLOAD_URL=https://beta.unity3d.com/download/c46a3a38511e/UnitySetup-2019.3.2f1

RUN apt-get update \
 && apt-get install -y curl libgtk2.0-0 libsoup2.4-1 python \
                       libarchive13 libglu1-mesa libgtk-3-0 \ 
                       libnss3 libasound2 libcap2 libgconf-2-4 \
                       lsb-release libunwind-dev libssl-dev git \
 && curl $UNITY_DOWNLOAD_URL > /tmp/unity-install \
 && chmod 755 /tmp/unity-install \
 && echo y|/tmp/unity-install --unattended -l /unity --components=Unity,WebGL,Mac-Mono,Windows-Mono -d /tmp/unity-download \
 && rm -rf /tmp/*

RUN apt-get install -y xvfb

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
