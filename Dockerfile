
FROM node:17-alpine as builder
COPY . /app
WORKDIR /app
RUN npm install
CMD ["node", "server.js"]
