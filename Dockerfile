FROM node:18-alpine
WORKDIR /usr/src/app

COPY package.json ./
COPY pnpm-lock.yaml ./

RUN npm install -g pnpm && pnpm i
COPY . .

CMD [ "node", "index.js" ]
