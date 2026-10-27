#!/bin/bash
export JENKINS_NODE_COOKIE=dontKillMe
export BUILD_ID=dontKillMe
setsid nohup npx http-server src -p 8081 -s &
