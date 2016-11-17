FROM node:argon

# NOTE: Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

ENV CONTENT_API_URL http://api:3001

EXPOSE 3000
CMD [ "npm", "start" ]
