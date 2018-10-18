#!/bin/bash

build_date=$(date "+%Y%m%d")
if [[ $# -eq 1 ]]; then
	build_date=$1
fi
echo using ${build_date}

build_dir="build/${build_date}"
if [ ! -d ${build_dir} ]; then
	echo directory does not exist
fi

aws-mfa --profile prod.nitzans --short-term-suffix session --long-term-suffix none

aws --profile prod.nitzans-session s3 sync --delete ${build_dir} s3://developer.simplex.com
