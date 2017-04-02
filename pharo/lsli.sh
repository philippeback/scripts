PHARO=./pharo-ui

function lsli() {
  LATEST_IMAGE=`ls -1t *.image | head -1`

  echo ${LATEST_IMAGE}
}

