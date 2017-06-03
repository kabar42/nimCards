#!/bin/bash

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`
SRC_DIR="$SCRIPT_DIR/../src"
BUILD_DIR="$SCRIPT_DIR/../build"

BUILD_OPTS=""


case "$1" in
    -d)
    BUILD_DIR="$BUILD_DIR/debug"
    BUILD_OPTS="$BUILD_OPTS --opt:none"
    ;;
    *)
    BUILD_DIR="$BUILD_DIR/release"
    BUILD_OPTS="$BUILD_OPTS -d:release --opt:speed"
    ;;
esac

if [ ! -e "$BUILD_DIR" ]; then
    mkdir -p "$BUILD_DIR"
fi

SRC_FILES=""
for file in $(find $SRC_DIR -name *.nim); do
    SRC_FILES="$SRC_FILES $file"
done

cmdLine="nim compile $BUILD_OPTS --out:\"$BUILD_DIR/nimCards\" $SRC_DIR/main.nim"
echo "$cmdLine"
exec $cmdLine
