#!/bin/sh
set -e

./gradlew buildAppDeb

mv -v ./hello-groovy/build/distributions/hello-groovy_*_amd64.deb .

deb_file=$(ls hello-groovy_*_amd64.deb)

sha256sum "$deb_file" >"$deb_file.sha256sum"
sha512sum "$deb_file" >"$deb_file.sha512sum"
