#!/usr/bin/env bash

setupEnv() {
  cd /home/ubuntu/microservice-app-example
  export KOPS_STATE_STORE=s3://cluster1-sannikay.tk
}

createClusterAndDeploy() {
  kops create cluster --name=cluster1-k8s-sannikay.tk --state=s3://cluster1-sannikay.tk --node-count=2 --node-size=t2.micro --master-size=t2.micro --zones=us-west-2b --networking=kubenet --yes
  kubectl create -R -f k8s/
}

run () {
  setupEnv
  setupAwsConfig
  createClusterAndDeploy
}

run