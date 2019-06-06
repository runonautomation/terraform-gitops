#!/bin/sh
set -x
set -e
DIR=$(pwd)
source $DIR/tf_vars.sh
echo Script directory: $DIR

PROJECT_ID=$TF_VAR_remote_state_project
BUCKET=$TF_VAR_remote_state_bucket

function write_backend {
echo "## Existing bucket configuration for $1":
cat $1 || true
cat << EOF > $1
terraform {
    backend "gcs" {
        bucket  = "$BUCKET"
        prefix  = "terraform/state/$2"
    }
}
EOF
echo "## New configuration for $1":
cat $1 || true
echo "## ============================================ ##"
}

write_backend production/networking/backend.tf production/networking
write_backend production/kubecluster_a/backend.tf production/kubecluster_a
