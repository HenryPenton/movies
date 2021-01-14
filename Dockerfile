FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#               __
#              / _)
#     _.----._/ /
#    /         /
# __/ (  | (  |
#/__.-'|_|--|_|
COPY package*.json ./

RUN npm ci --only=production
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .
RUN npm i -g typescript
RUN tsc */**.ts


CMD [ "node", "index.js" ]