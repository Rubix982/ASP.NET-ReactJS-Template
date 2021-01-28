FROM node

WORKDIR /App

COPY ./package.json /App/

COPY ./yarn-lock.json /App/

RUN npm install

COPY ./ /App/

CMD ["npm","start"]