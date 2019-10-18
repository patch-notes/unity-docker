FROM ubuntu:16.04

RUN apt-get update \
 && apt-get install -y curl libgtk2.0-0 libsoup2.4-1 python \
                       libarchive13 libglu1-mesa libgtk-3-0 \ 
                       libnss3 libasound2 libcap2 libgconf-2-4 \
                       lsb-release libunwind-dev libssl-dev \
 && curl https://beta.unity3d.com/download/7938dd008a75/UnitySetup-2019.1.8f1 > /tmp/unity-install \
 && chmod 755 /tmp/unity-install \
 && echo y|/tmp/unity-install --unattended -l /unity --components=Unity,WebGL -d /tmp/unity-download \
 && rm -rf /tmp/*

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
