#!/bin/bash -eu

if [ $# -lt 1 ]; then
  echo 'One argument required. input template name.'
  exit
fi

# Adjust your env file.
if [ -e .envrc ]; then
  source .envrc
fi

CFN_STACK_NAME=${CFN_STACK_PREFIX}-${1}
CFN_TEMPLATE=templates/${CFN_STACK_NAME}/template.yml

if [ ! -e ${CFN_TEMPLATE} ]; then
  echo 'invalid template name.'
  exit
fi