#
# Dockerfile for cpuminer
# usage: docker run creack/cpuminer --url xxxx --user xxxx --pass xxxx
# ex: docker run creack/cpuminer --url stratum+tcp://ltc.pool.com:80 --user creack.worker1 --pass abcdef
#
#

FROM		ubuntu:16.04

RUN		apt-get update -qq

RUN		apt-get install -qqy automake
RUN		apt-get install -qqy libcurl4-openssl-dev
RUN		apt-get install -qqy git
RUN		apt-get install -qqy make
RUN             apt-get install -qqy build-essential libssl-dev \
                        libgmp-dev \
                        libjansson-dev \
                        libcurl3 \
                        libjansson4
RUN		rm -rf /var/lib/apt/lists/*

RUN             git clone https://github.com/zcoinofficial/cpuminer-xzc

RUN             cd cpuminer-xzc && ./build.sh

WORKDIR         /cpuminer-xzc

ENTRYPOINT	["./cpuminer"]
