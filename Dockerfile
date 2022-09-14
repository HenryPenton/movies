FROM amd64/alpine

RUN apk update
RUN apk upgrade
RUN apk add --update nodejs npm
RUN npm install -g pnpm

RUN apk update
RUN apk upgrade
WORKDIR /usr/src/app

#               __
#              / _)
#     _.----._/ /
#    /         /
# __/ (  | (  |
#/__.-'|_|--|_|

COPY pnpm-lock.yaml ./
COPY package.json ./

RUN pnpm i

COPY . .

CMD [ "node", "index.js" ]