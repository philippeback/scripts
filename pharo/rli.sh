PHARO=./pharo-ui

# run latest image
function rli() {
  LATEST_IMAGE=`ls -1t *.image | head -1`

  echo "running latest image: ${LATEST_IMAGE}"
  ${PHARO} ${LATEST_IMAGE}
}

