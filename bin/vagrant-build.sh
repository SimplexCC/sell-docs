#!/bin/bash

build_date=$(date "+%Y%m%d")
build_dir="build/${build_date}"

rm -rf ${build_dir}
mkdir -p ${build_dir}
bundle exec middleman build --build-dir=${build_dir}
