FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
# If you are building your code for production
RUN npm install --only=production

# Bundle app source
COPY database.json ./
COPY ./src ./src

WORKDIR /usr/src/app/src/frontend
RUN ../../node_modules/.bin/bower install --allow-root

WORKDIR /usr/src/app

ENV KW_ENV=production

EXPOSE 8080
CMD [ "node", "src/backend/index.js" ]
