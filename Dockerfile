FROM node:lts-alpine

RUN npm -y -g install serve

WORKDIR /app/

COPY ./build/ .

EXPOSE 3000

CMD [ "serve","web" ]