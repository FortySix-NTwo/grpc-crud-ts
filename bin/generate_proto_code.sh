#!/usr/bin/env bash

#################################################################################
##              Generate Protocol Buffers Code Files For TypeScript            ##
#################################################################################
##  Usage:                                                                     ##
##                 Make sure to run all bash-script within the terminal,       ##
##                 from service's root folder.                                 ##
##                      $ bash ./scripts/gen-service.sh                        ##
#################################################################################
##  Contact Information:                                                       ##
##      Author: Jonathan Farber                                                ##
##      GitHub:        https://github.com/FortySix-NTwo                        ##
##      Twitter:       https://twitter.com/_JonathanFarber                     ##
##      LinkedIn:      https://www.linkedin.com/in/jonathan-farber-7197aa19    ##
##                                                                             ##
##        for more information regarding bash scripts,                         ##
##         please follow this link -> https://www.gnu.org/software/bash/       ##
#################################################################################

BASEDIR=$(dirname "$0")
cd ${BASEDIR}/../

npx grpc_tools_node_protoc \
  --js_out=import_style=commonjs,binary:./src/proto/Users \
  --grpc_out=./src/proto/Users \
  --plugin=protoc-gen-grpc=`which grpc_tools_node_protoc_plugin` \
  ./src/proto/Users/users.proto

npx protoc \
  --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
  --ts_out=./src/proto/Users \
  -I ./src/proto/Users/ \
  ./src/proto/Users/users.proto

