#!/bin/bash -eu

DIR=$(cd `dirname $0`/../; pwd)
cd $DIR

source settings.sh

echo '--- create lambda function on local ---'
aws --endpoint-url=http://localhost:4574 \
	--region=ap-northeast-1 \
	--profile=localstack lambda create-function \
	--function-name=${FUNCTION_NAME} \
	--runtime=python3.6 \
	--role=r1 \
	--handler=lambda.lambda_handler \
	--zip-file fileb://src/lambda.zip
