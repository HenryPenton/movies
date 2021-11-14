FROM amd64/alpine

RUN apk update
RUN apk upgrade
RUN apk add --update nodejs npm

WORKDIR /usr/src/app

#               __
#              / _)
#     _.----._/ /
#    /         /
# __/ (  | (  |
#/__.-'|_|--|_|

COPY package*.json ./

RUN npm ci --only=production

COPY . .

CMD [ "node", "index.js" ]