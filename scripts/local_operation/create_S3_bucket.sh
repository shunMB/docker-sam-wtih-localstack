#!/bin/bash -eu

DIR=$(cd `dirname $0`/../; pwd)
cd $DIR

source settings.sh

echo '--- create s3 bucket on local ---'
aws s3api create-bucket \
	--bucket ${BUCKET_PARAM}-serverless-deploy-bucket \
 	--create-bucket-configuration LocationConstraint=ap-northeast-1