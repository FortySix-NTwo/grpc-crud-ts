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
cd "${BASEDIR}"/../

PROTOC_GEN_TS_PATH="./node_modules/.bin/protoc-gen-ts"
GRPC_TOOLS_NODE_PROTOC_PLUGIN="./node_modules/.bin/grpc_tools_node_protoc_plugin"
GRPC_TOOLS_NODE_PROTOC="./node_modules/.bin/grpc_tools_node_protoc"

for f in ./src/proto/*; do
    if [ "$(basename "$f")" == "index.ts" ]; then
        continue
    fi

    ${GRPC_TOOLS_NODE_PROTOC} \
    --js_out=import_style=commonjs,binary:"${f}" \
    --grpc_out="${f}" \
    --plugin=protoc-gen-grpc="${GRPC_TOOLS_NODE_PROTOC_PLUGIN}" \
    -I "${f}" \
    "${f}"/*.proto

    ${GRPC_TOOLS_NODE_PROTOC} \
    --plugin=protoc-gen-ts="${PROTOC_GEN_TS_PATH}" \
    --ts_out="${f}" \
    -I "${f}" \
    "${f}"/*.proto

done
