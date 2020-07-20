FROM node:14.5.0-alpine3.12
COPY . /opt/app
WORKDIR /opt/app
RUN yarn
env "./.env"
EXPOSE "${PORT}"
RUN ln -sf /dev/stdout /debug.log
CMD yarn build && yarn start