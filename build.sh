#!/bin/bash

# mv assets ..
docker build --tag start9/electrum-ps .
docker save start9/electrum-ps > image.tar
docker rmi start9/electrum-ps
# mv ../assets .
appmgr -vv pack `pwd` -o `pwd`/electrum-ps.s9pk
