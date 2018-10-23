#!/bin/bash

aws-mfa --profile prod.nitzans --short-term-suffix mfa --long-term-suffix none

aws --profile prod.nitzans-mfa s3 sync --delete build/ s3://developer.simplex.com
