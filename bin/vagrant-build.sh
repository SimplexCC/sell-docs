#!/bin/bash

build_dir="build"

rm -rf ${build_dir}
mkdir -p ${build_dir}
bundle exec middleman build --build-dir=${build_dir}
