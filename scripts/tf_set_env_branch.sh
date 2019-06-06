#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $DIR/../
git checkout -b demo1
sed -i 's/backend.tf/backend_copy.tf/g' .gitignore