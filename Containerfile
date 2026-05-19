FROM clojure:temurin-8-trixie-slim

RUN apt-get update && apt-get install -y gcc git curl bash locales leiningen nodejs npm \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN useradd -ms /bin/bash devuser
RUN npx -y create-cljs-app app 
USER devuser
WORKDIR /home/devuser/app
