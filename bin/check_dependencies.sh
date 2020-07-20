#!/usr/bin/env bash
#################################################################################
##               check for unused dependencies in package.json                 ##
## ########################################################################### ##
##         Usage:                                                              ##
##                 Make sure to run all bash-script within the terminal,       ##
##                 from service's root folder.                                 ##
##                   $ bash ./bin/check_dependencies.sh                        ##
## ########################################################################### ##
##     Contact Information:                                                    ##
##      Author:        Jonathan Farber                                         ##
##      GitHub:        https://github.com/FortySix-NTwo                        ##
##      Twitter:       https://twitter.com/_JonathanFarber                     ##
##      LinkedIn:      https://www.linkedin.com/in/jonathan-farber-7197aa19    ##
##                                                                             ##
##        for more information regarding bash scripts,                         ##
##        please follow this like -> https://www.gnu.org/software/bash/        ##
#################################################################################

for dependencies in ${jq -r '.dependencies | keys | .[]' package.json}; do
  if ! grep "require\(.*$dependencies.*\)" -Rq --exclude-dir="node_modules" .; then
    echo "Dependency not found in use #dependencies it is safe to delete it"
  fi
done
