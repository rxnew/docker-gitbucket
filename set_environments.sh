#!/bin/bash

source ./env/gitbucket.env
export GITBUCKET_SSH_EXTERNAL_PORT=${GITBUCKET_SSH_EXTERNAL_PORT}
export GITBUCKET_SSH_INTERNAL_PORT=${GITBUCKET_SSH_INTERNAL_PORT}