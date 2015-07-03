FROM ubuntu:latest
MAINTAINER YuanRui <kuroei.jp@gmail.comt>

RUN apt-get update && apt-get install -y -q curl git python-dev python-pip  redis-server make ruby ruby-dev \
		&& apt-get clean

# Install go-resque
WORKDIR /usr/local/src/

RUN git clone https://github.com/seomoz/qless
RUN git clone https://github.com/seomoz/qless-core

WORKDIR /usr/local/src/qless-core/
RUN make qless.lua

WORKDIR /usr/local/src/qless
RUN gem install qless
RUN gem install thin

EXPOSE 6379
EXPOSE 5678

CMD qless
