#!/usr/bin/env bash

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

p "So, lets checkout what is in a builder"

pe "pack suggest-builders"
pe "pack inspect-builder cloudfoundry/cnb:bionic"
