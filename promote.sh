#!/bin/bash

echo "promoting the new version ${VERSION} to downstream repositories"

jx step create pr regex --regex 'AdminVersion = "(?P<version>.*)"' --version ${VERSION} --files pkg/plugins/version.go --repo https://github.com/jenkins-x/jx-cli.git

jx step create pr regex --regex 'version: (.*)' --version ${VERSION} --files docker/gcr.io/jenkinsxio-labs-private/jx-admin.yml --repo https://github.com/jenkins-x/jxr-versions.git