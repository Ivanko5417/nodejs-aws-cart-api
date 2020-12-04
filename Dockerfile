FROM node:14.15.1-alpine

WORKDIR /app
COPY ./package.json ./package-lock.json ./
RUN npm install


WORKDIR /app
COPY ./nest-cli.json ./tsconfig*.json ./
COPY ./src ./src
RUN npm run build

USER node
ENV PORT=8080
EXPOSE 8080

CMD node dist/main.js

