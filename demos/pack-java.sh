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

p "Right, lets demo building containers using pack"

p "We will need a Docker API v2 registry - using a local registry for this demo"
pe "docker run -d --name registry -p 5000:5000 --restart=always registry:2"

p "Using pack cli"
pe "pack"

# OK, lets build a Java app
pe "cd samples/apps/java-maven"
clear
p "This is a standard Java application"
pe "ls -l"
p "Notice: There is no dockerfile in this repo"
pe "pack build localhost:5000/java-app --builder cnbs/sample-builder:bionic --publish"
pe "pack inspect-image localhost:5000/java-app"
docker pull localhost:5000/java-app
pe "docker inspect localhost:5000/java-app"

p "We can start the docker container as normal"
clear
pe "docker run -d --name java-app --env PORT=8080 -p 8080:8080 localhost:5000/java-app"
p "And view the web application in a browser"
pe "open http://localhost:8080/"

p "Demo completed - phew!"

cleanup
