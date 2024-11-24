#!/bin/bash
set -e

./gradlew buildAppRpm

mv -v ./hello-groovy/build/distributions/hello-groovy-*.rpm .

rpm_file=$(ls hello-groovy-*.rpm)

sha256sum "$rpm_file" >"$rpm_file.sha256sum"
sha512sum "$rpm_file" >"$rpm_file.sha512sum"

rpm -qipl "$rpm_file"
