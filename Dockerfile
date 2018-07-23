FROM mhart/alpine-node:8

EXPOSE 3000

WORKDIR /app
ADD . /app
RUN npm install

CMD ["node","server.js"]