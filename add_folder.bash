#!/bin/bash

rel_path=$1
mkdir -p $rel_path && touch $rel_path/.placeholder
echo "!$rel_path/.placeholder" >> .gitignore
echo $path added
