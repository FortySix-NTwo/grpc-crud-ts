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
##               please follow this like                                        ##
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
git init

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
    "build": "rimraf ./build && npx tsc --skipLibCheck", 
    "start": "yarn build && node ./dist/src/index.js",
    "start:dev": "nodemon",
    "gen:protoc": "bash ./bin/protoc_gen_ts.sh"
    }
}' >> package.json

# install dependencies
yarn add dotenv google-protobuf grpc

# install development dependencies
yarn add -D nodemon rimraf @types/dotenv \
    @types/google-protobuf @types/node grpc-tools \
    grpc_tools_node_protoc_ts typescript

# create folder structure
mkdir -p src/ src/proto/ src/server/ dist/ build/ public/

# add a .gitkeep file in public folder
touch public/.gitkeep

# create a .proto file
touch src/proto/api.proto

# add an index.ts in all folders (except bin, dist, build and public)
for folder in $(ls -d */)
do
	case "$folder" in
		# ignore bin folder
		*"bin"*) ;;
		# ignore build folder
		*"build"*) ;;
		# ignore dist folder
		*"dist"*) ;;
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
CMD yarn watch' >> Dockerfile

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

build
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
# Packages and Binaries    #
############################

*.7z
*.csv
*.dat
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip
*.com
*.class
*.dll
*.exe
*.o
*.seed
*.so
*.swo
*.swp
*.swn
*.swm
*.out
*.pid

############################
# Logs and databases       #
############################

.tmp
*.log

############################
# Misc.                    #
############################

*#
ssl
.idea
nbproject
public/uploads/*
!public/uploads/.gitkeep" >> .gitignore && cp .gitignore .dockerignore

# configure tslint.json file
echo '{
    "defaultSeverity": "error",
    "extends": ["tslint:recommended"],
    "jsRules": {},
    "rules": {
        "no-console": false
    },
    "rulesDirectory": []
}' >> tslint.json

# configure tsconfig.json file
echo '{
    "compilerOptions": {
        "outDir": "./dist/",
        "module": "commonjs",
        "noImplicitAny": true,
        "allowJs": true,
        "esModuleInterop": true,
        "target": "es6",
        "sourceMap": true
    },
    "include": ["./src/**/*"],
    "exclude": ["node_modules"]
}' >> tsconfig.json

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
(i.e create, read, update and delete API), for a Blog app implemented in TypeScript.

## License

[MIT](LICENSE)' >> README.md

# add all files to local repo
git add .

# commit files
git commit -m "Initial Commit - Project Generated With Bash Script"

# tag the release version
git tag v1.0.0

# build dockerfile
docker build .
