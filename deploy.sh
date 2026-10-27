#!/bin/bash
export JENKINS_NODE_COOKIE=dontKillMe
export BUILD_ID=dontKillMe
pkill -f "8081" 2>/dev/null || true
nohup python3 -m http.server 8081 --directory src > /tmp/server.log 2>&1 &
sleep 2
echo "Deployed successfully on port 8081"
