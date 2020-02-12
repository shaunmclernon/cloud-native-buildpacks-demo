#!/usr/bin/env bash

cleanup() {
    docker stop nodejs-app &> /dev/null
    docker rm nodejs-app &> /dev/null
}

. ./demos/start-registry.sh
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

p "Right, lets rebuild the app to pick up our changes"

pe "pack build localhost:5000/nodejs-app \
    --builder cloudfoundry/cnb:bionic \
    --path samples/apps/nodejs-npm/ \
    --publish"
docker pull localhost:5000/nodejs-app
docker run -d --name nodejs-app --env PORT=8080 -p 8080:8080 localhost:5000/nodejs-app
p "And refresh the web application in a browser"
pe "open http://localhost:8080/"

p "Done!"
wait

cleanup
