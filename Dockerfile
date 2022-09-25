# base image
FROM node:latest

# set working directory
RUN mkdir /app
WORKDIR /app

# add `/usr/src/app/node_modules/.bin` to $PATH
# ENV PATH /usr/src/app/node_modules/.bin:$PATH
ENV NODE_ENV production

# install and cache app dependencies
COPY package.json /app/package.json
COPY package-lock.json /app/package.json
COPY . /app
# RUN npm install --silent
# RUN npm install react-scripts@1.1.1 -g --silent
RUN npm install
RUN npm run build

#Port
EXPOSE 3000

# start app
CMD ["node", "./server"]