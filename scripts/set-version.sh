#!/bin/sh
set -e

# shellcheck disable=SC1091
. ./release.env

sed -i 'hello-groovy/gradle.properties'  -e 's@version = .*@version = '"$RELEASE_VERSION"'@g'
sed -i 'hello-groovy/build.gradle'  -e 's@hello-groovy-.*-all.jar@hello-groovy-'"$RELEASE_VERSION"'-all.jar@g'
sed -i 'hello-groovy/src/scripts/hello-groovy'  -e 's@readonly VERSION=.*@readonly VERSION='"$RELEASE_VERSION"'@g'
