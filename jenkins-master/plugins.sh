#!/usr/bin/env bash
for word in $(cat list.txt); do java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin  $word; done