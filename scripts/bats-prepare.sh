#!/bin/bash
set -e

deb_file=$(ls hello-groovy_*_amd64.deb)
if [[ ! -f "$deb_file" ]]; then
  echo "No deb file found"
  exit 1
fi

apt install -y bats
apt install -y ./"$deb_file"

git clone --separate-git-dir="$(mktemp -u)" https://github.com/bats-core/bats-support.git test_helper/bats-support && rm test_helper/bats-support/.git
git clone --separate-git-dir="$(mktemp -u)" https://github.com/bats-core/bats-assert.git test_helper/bats-assert && rm test_helper/bats-assert/.git
