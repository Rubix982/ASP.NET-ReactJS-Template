FROM node:10

WORKDIR /App

COPY ./package.json ./yarn.lock /App/

RUN yarn && yarn add node-sass@4.14.1 && npm rebuild node-sass

COPY ./ /App/

CMD ["yarn","start"]