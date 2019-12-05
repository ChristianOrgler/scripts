#!/bin/sh

function clean()
{
  # Loop through all sub directories of the current directory
  for sub_dir in $1*/ ; do
    cd $sub_dir

    # Check if the current directory is the root of a git repository
    if [[ $(git rev-parse --show-toplevel 2>/dev/null) = "$PWD" ]]; then
      echo "> Cleaning: '$sub_dir'"
      git gc
      echo ">-----------------------------------------"
    
    # If not, check if there is a chance that
    # there is a git repository in this directory or not.
    elif [ -z "$(find . -type d -name ".git")" ]; then
      echo "The directory '$sub_dir' does not contain any GIT repository."
    
    # If so, recursively do the same trick
    else
      clean $sub_dir
    fi
  done
}

root_dir="$1"
# Abort if there is not root directory mentioned
if [ ! -n "$root_dir" ]; then
  echo "No root directory set as argument"
  exit 0
else
  clean $root_dir
fi
