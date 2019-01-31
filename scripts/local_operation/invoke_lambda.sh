#!/bin/bash -eu

DIR=$(cd `dirname $0`/../; pwd)
cd $DIR

source settings.sh

echo '--- invoke lambda function on local ---'
aws lambda --endpoint-url=http://localhost:4574 invoke \
	--function-name=${FUNCTION_NAME} \ 
	--payload=${PAYLOADS} \
	${LOG_FILE}