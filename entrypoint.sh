#!/bin/bash

tgtd -f &> tgt.log &
tgtadm --op update --mode sys --name State -v offline
tgt-admin -e -c /etc/tgt/targets.conf
tgtadm --op update --mode sys --name State -v ready
tail -f tgt.log
