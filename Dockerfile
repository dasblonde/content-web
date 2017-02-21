FROM node:argon

# Need bower to install client side packages
RUN npm install -g bower

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Install client side app dependencies
COPY .bowerrc /usr/src/app
COPY bower.json /usr/src/app
RUN bower --allow-root install

# Bundle app source
COPY . /usr/src/app

EXPOSE 3000
CMD [ "npm", "start" ]
