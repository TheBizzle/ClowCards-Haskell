#!/usr/bin/env bash

gulp clean
rm -rf ./target/ ./output/
stack clean
stack build
./.stack-work/dist/x86_64-linux/Cabal-1.22.4.0/build/clowcards/clowcards -p 8080
