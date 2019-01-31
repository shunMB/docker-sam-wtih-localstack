#!/bin/bash -eu

DIR=$(cd `dirname $0`/../; pwd)
cd $DIR

source scripts/settings.sh

# package if SAM syntax
if grep 'AWS::Serverless-2016-10-31' ${CFN_TEMPLATE} >/dev/null; then
  echo '--- copy src directory and yarn install ---'
  sh script/prepare_src.sh $@

  echo '--- package ---'
  aws cloudformation package \
    --template-file ${CFN_TEMPLATE} \
    --s3-bucket ${S3_BUCKET_NAME_FOR_SAM_PACKAGE} \
    --output-template-file tmp/packaged-template.yml \
    --profile ${AWS_PROFILE} \
  ;
  template_file=tmp/packaged-template.yml
else
  template_file=${CFN_TEMPLATE}
fi

echo '--- deploy ---'
aws cloudformation deploy \
  --template-file ${template_file} \
  --stack-name ${CFN_STACK_NAME} \
  --profile ${AWS_PROFILE} \
  ${@:2}\
;
