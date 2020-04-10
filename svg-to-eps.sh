#!/bin/bash
inkscape $1 -E $(echo "$1" | sed "s/svg/eps/g") --export-ignore-filters --export-ps-level=3
