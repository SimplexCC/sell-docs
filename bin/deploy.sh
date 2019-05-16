#!/bin/bash

aws --profile prod s3 sync --delete build/ s3://developer.simplex.com
