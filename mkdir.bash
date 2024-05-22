#!/bin/bash


# Set IFS to /
IFS='/'
rel_path=$1
# Read the string into an array based on the delimiter
read -ra ADDR <<< "$rel_path"

# Reset IFS to default value (space, tab, newline)
IFS=' '

# Get the current directory where the script was started
current_dir="$(pwd)"

check_path_exists() {
    local path_to_check="$1"
    
    if [ -e "$path_to_check" ]; then
        echo "The path '$path_to_check' exists."
    else
        echo "The path '$path_to_check' does not exist."
        mkdir -p $path_to_check && touch $path_to_check/.gitignore
        echo "*\n!.gitignore\n!*/" >> $path_to_check/.gitignore
        echo $path_to_check added
    fi
}

# Full path accumulator
full_path="$current_dir"

# Loop through the array elements
for element in "${ADDR[@]}"; do
    full_path="$full_path/$element"
    check_path_exists "$full_path"
done


