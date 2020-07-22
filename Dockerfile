FROM node:14.5.0-alpine3.12
RUN apt-get update
COPY . /opt/app
WORKDIR /opt/app
RUN yarn
ARG PORT
ENV PORT=$PORT
CMD yarn build && yarn start
