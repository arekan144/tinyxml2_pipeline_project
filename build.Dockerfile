FROM ubuntu:22.04

RUN apt-get update && apt-get install -y git \
 && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./* .

RUN make rebuild
