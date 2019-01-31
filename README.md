# MINIFIED SERVELESS APPLICATION TEMPLATE
This is serveless applitation template using AWS SAM based on localstack and Alis project, and made it simplified.
With this template, you will be able to execute local test, integrate aws services(lambda, s3, dynamoDB, apigateway...) on verification environment, and deploy/delete to AWS.  
See: https://github.com/localstack/localstack
See: https://github.com/AlisProject/serverless-application

# Prerequisite
- aws-cli
- direnv
- docker
###- pyenv
###- rbenv

# Installation
With pyenv
```bash
git clone https://github.com/shunMB/sam-docker-template.git
cd sam-docker-template
pyenv install 
# libraries
python -m venv venv
. venv/bin/activate
pip install -r requirements.txt
pip install -r requirements_test.txt
```

## Environment variables
```bash
# Create .envrc to suit your environment.
cp -pr .envrc.sample .envrc
vi .envrc # edit

# allow
direnv allow
```

## Setting AWS profile configuration
```bash
# Aws profile name that you resister through aws-configure command `aws configure --profile PROFILE_NAME`
# For use localstack
$ aws configure --profile localstack
AWS Access Key ID [None]: dummy
AWS Secret Access Key [None]: dummy
Default region name [None]: ap-northeast-1
Default output format [None]: text
# For deploy/delete...
$ aws configure --profile YOUR_PROFILE_NAME
```

# Test
## Set up dynamoDB local
Download and unzip the [dynamoDB local zip](https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/DynamoDBLocal.html) in any directory

For example
```
$ curl -O https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz
$ tar xf ./dynamodb_local_latest.tar.gz
$ rm ./dynamodb_local_latest.tar.gz
```

## Excecute Test
```
Later
```

# Create AWS service on localstack

## Create Lambda function
```bash
$ sh scripts/local_operation/create_lambda.sh
```

## Invoke Lambda function 
```bash
$ sh scripts/local_operation/invoke_lambda.sh
```

## Create S3 bucket
```bash
$ sh scripts/local_operation/create_s3_bucket.sh 
```

# Deployment via AWS Cloud Formation
```
Later
```

## Packaging and deployment

### Packaging
```
Later
```

### DynamoDB
```
Later
```

### Lambda & API Gateway
```
Later
```

