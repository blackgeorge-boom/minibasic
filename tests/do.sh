#!/bin/sh

if [ "$1" != "" ]; then
    echo "Compiling $1"
    ./minibasic < $1 > a.ll || exit 1
    llc-5.0 a.ll -o a.s
    clang-5.0 a.s lib.a -o a.out
fi
