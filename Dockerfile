FROM node:14


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