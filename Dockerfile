FROM debian:9.9-slim

# Install tools
RUN \
  apt update -y && \
  apt upgrade -y && \
  apt -y install \
    gcc \
    curl

# Install tensorflow for C
RUN \
  curl -o tensorflow.tar.gz https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.13.1.tar.gz && \
  tar -C /usr/local -xzf tensorflow.tar.gz && \
  ldconfig && \
  rm -rf tensorflow.tar.gz

# Compile C source
WORKDIR /root
COPY ./sample.c /root
RUN \
  gcc sample.c -ltensorflow -o sample

CMD ["/root/sample"]

LABEL maintainer "OriishiTakahiro"
