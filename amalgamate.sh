#!/bin/bash

# Find all .txt files recursively, except the output file itself
find . -type f -name "*.txt" ! -name "all_domains.txt" \
    -exec cat {} + | sort | uniq > all_domains.txt