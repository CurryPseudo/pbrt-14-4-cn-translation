#!/bin/bash

inkscape $1 -E $((test -n "$2" && echo "$2") || echo "$1" | sed "s/svg/eps/g") --export-ignore-filters --export-ps-level=3
