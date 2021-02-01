FROM node

WORKDIR /App

COPY ./package.json ./yarn.lock /App/

RUN yarn

COPY ./ /App/

CMD ["yarn","start"]