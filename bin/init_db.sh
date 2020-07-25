#!/usr/bin/env bash
#################################################################################
##                       Users-DB Initialisation Script                        ##
#################################################################################
##  Usage:                                                                     ##
##            Automated to run with Dockerfile.postgres                        ##
##  NOTE:                                                                      ##
##            When Running Manually,                                           ##
##            Make sure to run all bash-script within the terminal,            ##
##            from service's root folder.                                      ##
##                     $ bash ./scripts/gen-service.sh                         ##
#################################################################################
##  Contact:                                                                   ##
##        Author:      Jonathan Farber                                         ##
##        GitHub:      https://github.com/FortySix-NTwo                        ##
##        Twitter:     https://twitter.com/_JonathanFarber                     ##
##        LinkedIn:    https://www.linkedin.com/in/jonathan-farber-7197aa19    ##
##                                                                             ##
##        for more information regarding bash scripts,                         ##
##         please follow this link -> https://www.gnu.org/software/bash/       ##
#################################################################################

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE TABLE USERS (user_id varchar(200), full_name text not null, user_name text not null, email text unique not null, hashed_password text unique not null, created_at date, updated_at date, inactive boolean);
    CREATE TABLE ROLES (user_id varchar(200), user_role varchar(200));
EOSQL
