#!/usr/bin/env bash

#################################################################################
##           Generate Certificates for SSL Secure Connection (HTTP/2)          ##
## ########################################################################### ##
##  Usage:                                                                     ##
##                 Make sure to run all bash-script within the terminal,       ##
##                 from service's root folder.                                 ##
##                   $ bash ./bin/generate_certs.sh                            ##
## ########################################################################### ##
##  Contact Information:                                                       ##
##      Author:        Jonathan Farber                                         ##
##      GitHub:        https://github.com/FortySix-NTwo                        ##
##      Twitter:       https://twitter.com/_JonathanFarber                     ##
##      LinkedIn:      https://www.linkedin.com/in/jonathan-farber-7197aa19    ##
##                                                                             ##
##        for more information regarding bash scripts,                         ##
##        please follow this link -> https://www.gnu.org/software/bash/        ##
##                                                                             ##
##      for more information regarding SSL Secure Certificates, please follow  ##
##      this link -> https://en.wikipedia.org/wiki/Transport_Layer_Security    ##
#################################################################################

echo "Generating SSL Certificate Files"
cd certs/
openssl genrsa -passout pass:1111 -des3 -out ca.key 4096
openssl req -passin pass:1111 -new -x509 -days 365 -key ca.key -out ca.crt -subj  "/C=US/ST=WA/L=Seattle/O=Test/OU=Test/CN=ca"
openssl genrsa -passout pass:1111 -des3 -out server.key 4096
openssl req -passin pass:1111 -new -key server.key -out server.csr -subj  "/C=US/ST=WA/L=Seattle/O=Test/OU=Server/CN=localhost"
openssl x509 -req -passin pass:1111 -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
openssl rsa -passin pass:1111 -in server.key -out server.key
openssl genrsa -passout pass:1111 -des3 -out client.key 4096
openssl req -passin pass:1111 -new -key client.key -out client.csr -subj  "/C=US/ST=WA/L=Seattle/O=Test/OU=Client/CN=localhost"
openssl x509 -passin pass:1111 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt
openssl rsa -passin pass:1111 -in client.key -out client.key
cd ..
echo "Files have Been Generated Successfully"