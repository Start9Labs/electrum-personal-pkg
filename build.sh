#!/bin/bash

# mv assets ..
wget -O tmpl https://beta-registry.start9labs.com/sys/tmpl-musl?version=0.1.1
chmod a+x tmpl
docker build --tag start9/electrum-ps .
# docker save start9/electrum-ps > image.tar
docker rmi start9/electrum-ps
# mv ../assets .
# appmgr -vv pack `pwd` -o `pwd`/electrum-ps.s9pk
