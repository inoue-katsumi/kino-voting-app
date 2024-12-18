#!/bin/bash
# yq is available from https://github.com/mikefarah/yq
#
export SECURE_API_TOKEN=bfaba6ee-813d-44d8-9433-b5bfb13dd7cc
export API_URL=https://app.au1.sysdig.com/

yq --no-doc '.spec.template.spec.containers[].image' k8s-specifications/*-deployment.yaml |
while read image
do
  sysdig-cli-scanner --apiurl=$API_URL $image
done
