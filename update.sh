#!/bin/bash

# ./update.sh <version>

if [ $# -gt 0 ] ; then
    hash=$1
else
    hash=latest
fi

echo "version: $hash"
sed -i.bak "/app-weibo:/s/\(app-weibo:\)\([^\"]*\)/\1${hash}/" docker-compose.yml
sed -i.bak "/app-nginx:/s/\(app-nginx:\)\([^\"]*\)/\1${hash}/" docker-compose.yml

docker-compose pull
# 暂不支持蓝绿布署
docker-compose up -d --renew-anon-volumes