FROM mhart/alpine-node:8.11.3

EXPOSE 3000
WORKDIR /app
ADD package.json /app
RUN npm install

# add the rest of the files
ADD . ./app
  
CMD ["node","server.js"]