#!/usr/bin/env bash

##################################################################################
##                    Bootstrap Script for gRPC C.R.U.D. API                    ##
##################################################################################
##  Usage:                                                                      ##
##              Make sure to run all bash-script within the terminal,           ##
##              from projects root folder.                                      ##
##                   $ bash ./bin/bootstrap_project.sh                          ##
##                                                                              ##
##               for more information regarding bash scripts,                   ##
##               please follow this link                                        ##
##                   -> https://www.gnu.org/software/bash/                      ##
##  Note:                                                                       ##
##              This script assumes that Git-SCM is installed,                  ##
##              if not for further details please follow this link              ##
##                   -> https://git-scm.com/download/win                        ##
##                                                                              ##
##################################################################################
##  Contact Information:                                                        ##
##          Author:     Jonathan Farber                                         ##
##          GitHub:     https://github.com/FortySix-NTwo                        ##
##          Twitter:    https://twitter.com/_JonathanFarber                     ##
##          LinkedIn:   https://www.linkedin.com/in/jonathan-farber-7197aa19    ##
##                                                                              ##
##################################################################################

# initialize git local repo
#git init

# initialize package.json file
yarn init -y

# configure nodemon for ts
echo '{
  "watch": ["src"],
  "ext": ".ts,.js",
  "ignore": [],
  "exec": "ts-node ./src/index.ts"
}' >> nodemon.json

# Insert Script Commands into package.json file
sed -i '' -e '$ d' package.json
echo ',
  "scripts": {
    "build": "rimraf ./dist/ && npx tsc --skipLibCheck",
    "start": "yarn build && node ./dist/src/index.js",
    "test": "jest --forceExit --verbose",
    "gen:protoc": "bash ./bin/protoc_gen_ts.sh",
    "gen:certs": "bash ./bin/generate_certs.sh",
    "start:dev": "nodemon"
  }
}' >> package.json

# create folder structure
mkdir -p  \
  build/ certs/ dist/ src/ public/ \
  src/handler/ src/persistence/ src/proto/ src/server/ src/utilities/ \
  src/persistence/entity/ src/persistence/migration/ src/proto/user/

# add a .gitkeep file in public folder
touch public/.gitkeep

# create a .proto file
touch src/proto/user/user.proto

# add an index.ts in all folders (except bin, build, certs, dist and public)
for folder in $(ls -d */)
do
	case "$folder" in
		# ignore bin folder
		*"bin"*) ;;
    # ignore bin folder
		*"build"*) ;;
		# ignore dist folder
		*"dist"*) ;;
    # ignore bin folder
		*"certs"*) ;;
    # ignore public folder
    *"public"*) ;;
		# default case
		*) touch $folder/index.ts
		echo "adding index.ts to $folder"
    ;;
	esac
done

# create .env files
touch .env.test
echo '# Node Environment Stage
NODE_ENV=

# Service Port & Host
PORT=
HOST=

# PostgreSQL Database Variables
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_DB=' >> .env.example && cb .env.example .env

# create a Dockerfile
echo 'FROM node:14.5.0-alpine3.12
COPY . /opt/app
WORKDIR /opt/app
RUN yarn
ARG PORT
ENV PORT=$PORT
CMD yarn build && yarn start' >> Dockerfile

# create docker-compose.yml & docker-compose-test.yml files
echo '"version: "3"
services:
  users-service:
    build:
      context: ./
      dockerfile: ./Dockerfile
    image: fortysix-ntwo/grpc-api:1.0
    init: true
    env_file:
      - ./.env
    environment:
      - PORT="${PORT}"
    depends_on:
      - postgres
    networks:
      network:
      ipv4_address: 172.20.0.2
    volumes:
      - appdata:/opt/app
    working_dir: /opt/app
    ports:
      - ${PORT}:50052
    restart: always

  postgres:
    image: postgres:12.3-alpine
    init: true
    environment:
      - POSTGRES_USER="${POSTGRES_USER}"
      - POSTGRES_PASSWORD="${POSTGRES_PASSWORD}"
      - POSTGRES_DB="${POSTGRES_DB}"
      - PG_PORT="${PG_PORT}"
    networks:
      network:
      ipv4_address: 172.20.0.2
    volumes:
      - postgres:/var/lib/postgresql/data
    ports:
      - ${PG_PORT}:5432
    restart: always

networks:
  network:
    driver: bridge
    ipam:
    config:
      - subnet: 172.20.0.0/16

volumes:
  postgres:
  appdata:' >> docker-compose.yml && cp docker-compose.yml docker-compose-test.yml

# create a Makefile
echo 'NAME := fortysix-ntwo/grpc-api:1.0

up:
	docker build -t $(NAME) -f Dockerfile .
	docker-compose rm -fsv
	docker-compose up --build

stop:
  docker-compose stop

down:
  docker-compose down -v
  docker-compose rm -fsv
  make docker-clean

test:
	docker-compose rm -fsv
	make docker-clean
	docker-compose -f docker-compose-test.yml up --build --exit-code-from test --abort-on-container-exit

docker-clean:
	@echo "Delete all untagged/dangling (<none>) images"
	-docker rmi `docker images -q -f dangling=true` --force
	-docker volume rm `docker volume ls -f dangling=true -q`' >> Makefile

# create a .gitignore and .dockerignore
echo "#############################
# Node.JS                   #
# Generated Files & Modules #
#############################

node_modules
.node_history
lib-cov
lcov.info
pids
logs
results

#############################
# Project Files and Folders #
#############################

dist
.cache
.env
.env.test
.vscode

#############################
# MacOS                     #
# Operating System Files    #
#############################

.DS_Store
.AppleDouble
.LSOverride
Icon
.Spotlight-V100
.Trashes
._*

############################
# Logs                     #
############################

logs
*.log
yarn-debug.log*
yarn-error.log*
.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/

############################
# Misc.                    #
############################

*#
ssl
pids
*.pid
.idea
*.seed
nbproject
*.pid.lock
*.tsbuildinfo
public/uploads/*
!public/uploads/.gitkeep" >> .gitignore && cp .gitignore .dockerignore

# configure .editorconfig file
echo 'root = true

[*]
indent_style = space
indent_size = 2
tab_width = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true' >> .editorconfig

# configure tsconfig.json file
echo '{
  "compilerOptions": {
    "outDir": "./build",
    "module": "commonjs",
    "noImplicitAny": true,
    "allowJs": true,
    "esModuleInterop": true,
    "target": "es6",
    "sourceMap": true,
    "experimentalDecorators": true
  },
  "include": ["./src/**/*"],
  "exclude": ["node_modules"]
}' >> tsconfig.json

# create a jest.config.js file
echo 'module.exports = {
  globals: {
      "ts-jest": {
          tsConfig: "tsconfig.json"
      }
  },
  moduleFileExtensions: [
      "ts",
      "js"
  ],
  transform: {
      "^.+\\.(ts|tsx)$": "ts-jest"
  },
  testMatch: [
      "**/*.test.(ts|js)"
  ],
  testEnvironment: "node"
};' >> jest.config.js

# create an MIT license file
echo 'MIT License

Copyright (c) [year] [full_name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.' >> LICENSE

# create a README file
echo '# gRPC C.R.U.D API

## In Node.JS with TypeScript

### Overview

The Following projects details a gRPC Node.JS C.R.U.D. API,
(i.e create, read, update and delete API), which is implemented in TypeScript.

## License

[MIT](LICENSE)' >> README.md

# install dependencies
yarn add dotenv google-protobuf grpc typeorm

# install development dependencies
yarn add -D @types/dotenv @types/google-protobuf @types/node \
  grpc-tools grpc_tools_node_protoc_ts typescript ts-node nodemon rimraf 

# add all files to local repo
git add .

# commit files
git commit -m "Initial Commit - Project Generated With Bash Script"

# tag the release version
#git tag v1.0.0

# build dockerfile
docker build .
