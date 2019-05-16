# Simplex API documentation

## Install

    bundle install

## Run

    ./bin/run.sh

You can now see the docs at http://localhost:4567. Whoa! That was fast!

## Deployment

You first need to build the statis files

    ./bin/build.sh
    
We host the developer documentation on S3 bucket named `s3://developer.simplex.com` found in our production AWS account.

In order to push the static files to S3 you need access to the AWS account and the bucket.

The deployment script expects AWS credentials and AWS CLI installed

You should have the following profile in `~/.aws/credentials` file

```json
[prod]
aws_access_key_id = ...
aws_secret_access_key = ...

```

After you have the credentials in place you deploy by running the following:

    ./bin/deploy.sh    

