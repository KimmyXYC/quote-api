FROM nikolaik/python-nodejs:python3.12-nodejs21-slim AS builder

WORKDIR /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update && apt-get install -y build-essential gcc wget git libvips && rm -rf /var/lib/apt/lists/*

ADD . $NODE_WORKDIR

RUN npm install canvas@2.11.2 && npm install # TODO: canvas crashes if installed via npm install from package.json
