## Dockerfile to build RL Chatbot container image

FROM python:3.5.2
MAINTAINER vt

ARG TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0rc1-cp35-cp35m-linux_x86_64.whl

## dependencies
RUN \
  apt-get -qq -y update && \
  pip3 install -U $TF_BINARY_URL \
  jieba

COPY ./ /root/RL_Chatbot

## Run Config
COPY docker/chatbot.sh /root/DRL_Chatbot/
WORKDIR /root/DRL_Chatbot/
CMD bash chatbot.sh
