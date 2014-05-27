#!/bin/bash
#
# this script should not be run directly,
# instead you need to source it from your .bashrc,
# by adding this line:
#   . ~/MyScripts/extracommands.sh
#

# WORKSPACES=~/Documents/Smalltalk/2-MyWorkspaces

PHARO=./pharo-ui

# opw (open ${PHARO} workspace)
function opw() {
  echo "going to ${1} workspace"
  cd ${WORKSPACES}/workspace$1
}

# remove ${PHARO} workspace
function rmpw() {
  echo "removing ${1} workspace"
  read -p "Are you sure? " -n 1
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
         exit 1
  fi
  rm -rf ${WORKSPACES}/workspace${1}
}

# run latest image
function rli() {
  LATEST_IMAGE=`ls -1t *.image | head -1`

  echo "running latest image: ${LATEST_IMAGE}"
  ${PHARO} ${LATEST_IMAGE}
}

# ls latest image
function lsli() {
  LATEST_IMAGE=`ls -1t *.image | head -1`

  echo ${LATEST_IMAGE}
}

# create new workspace
function mkpw() {
   echo "Creating workspace $1"
   WORKSPACE=${WORKSPACES}/workspace$1

   mkdir ${WORKSPACE}
   cp /usr/local/${PHARO}/image/20/Pharo.image ${WORKSPACE}/Pharo.image
   cp /usr/local/${PHARO}/image/20/Pharo.changes ${WORKSPACE}/Pharo.changes
   chmod u+w ${WORKSPACE}/Pharo.image
   chmod u+w ${WORKSPACE}/Pharo.changes
   echo "${WORKSPACE} created"
}

# get latest ${PHARO} 3.0
function fetchfresh30() {
    echo "Fetching a fresh Pharo 3.0 + Latest VM from web"
    curl get.${PHARO}.org/30+vmLatest | bash
}

# get latest ${PHARO} 2.0
function fetchfresh20() {
    echo "Fetching a fresh Pharo 2.0 + Latest VM from web"
    curl get.${PHARO}.org/20+vmLatest | bash
}

#get stable VM
function fetchstablevm() {
   echo "Fetching stable VM from web"
   curl get.${PHARO}.org/vm | bash
}

# go to the getpharo web page
function gogetpharo() {
  open "http://get.pharo.org"
}

# go to the getpharo web page
function gopharobugs() {
  open "http://pharo.fogbugz.com"
}

# go to the pharo website
function gopharo() {
  open "http://pharo.org"
}
