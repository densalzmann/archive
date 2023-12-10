#!/bin/bash

rel_path=$1
mkdir -p $rel_path && touch $rel_path/.gitignore
echo "*
!.gitignore" >> $rel_path/.gitignore
echo $rel_path added
