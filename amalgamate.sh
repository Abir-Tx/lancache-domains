#!/bin/bash

# Amalgamate all .txt domain files into all_domains.txt, excluding itself
find . -type f -name "*.txt" ! -name "all_domains.txt" -exec cat {} + | sort | uniq > all_domains.txt