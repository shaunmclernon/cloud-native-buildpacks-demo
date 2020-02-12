#!/usr/bin/env bash

cleanup() {
    docker stop registry &> /dev/null
    docker rm registry &> /dev/null

    docker stop java-app &> /dev/null
    docker rm java-app &> /dev/null
}

cleanup

########################
# include the magic
########################
. ./demo-magic.sh

########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=50

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear

########################
# DEMO STARTS HERE
########################

p "Right, rebase the application"

docker run -d --name registry -p 5000:5000 --restart=always registry:2

pe "pack rebase localhost:5000/nodejs-app \
    --path samples/apps/nodejs-npm/ \
    --publish"

docker pull localhost:5000/nodejs-app
pe "docker run -d --name nodejs-app --env PORT=8080 -p 8080:8080 localhost:5000/nodejs-app"
p "And view the web application in a browser"
pe "open http://localhost:8080/"

p "Done"

cleanup
