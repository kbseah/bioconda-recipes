#!/bin/bash

set -e

GELUSTER_HOME=${PREFIX}/opt/geluster-${PKG_VERSION}
mkdir -p ${GELUSTER_HOME}

# for zlib to be found by compiler
export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"
export CPATH=${PREFIX}/include

cd ${SRC_DIR}/src
# override hardcoded compiler name
make CC=$CC
make CXX=$CXX
make release
# binaries built here
cp -r ${SRC_DIR}/src ${GELUSTER_HOME}/src
# test folder
cp -r ${SRC_DIR}/sample_test ${GELUSTER_HOME}/sample_test
# shell script with user CLI
cp ${SRC_DIR}/GeLuster ${GELUSTER_HOME}/GeLuster

mkdir -p ${PREFIX}/bin
ln -s ${GELUSTER_HOME}/GeLuster ${PREFIX}/bin/
