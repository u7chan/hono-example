FROM node:22-slim

WORKDIR /workspace

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    openssh-client \
    zip \
    locales \
    && npm i -g bun \
    && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8" \
    TZ=Asia/Tokyo