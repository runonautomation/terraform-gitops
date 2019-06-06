#!/bin/sh
set -e
set -x

DIR=$(pwd)
echo === Script directory: $DIR ===
source $DIR/tf_vars.sh

export TF_LOG=TRACE

function init {
    cd $1
    terraform init
    cd $DIR
}

function get {
    cd $1
    terraform get -update
    cd $DIR
}

function validate {
    cd $1
    terraform validate
    cd $DIR
}

function plan {
    cd $1
    terraform plan -out $2
    cd $DIR
}

function apply {
    cd $1
    ls -lahr
    terraform apply -input=false $2
    cd $DIR
}

##
# Infrastructure components in specific order
##
$1 production/networking networking.tfplan
$1 production/kubecluster_a kubecluster_a.tfplan
