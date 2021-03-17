#!/bin/sh

oc process -f spm-jenkins-agent-template.yml \
    | oc create -f -