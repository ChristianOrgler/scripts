#!/bin/sh

function validate
{
  dir=$1

  # Check if directory is not empty
  if [ -z "$dir" ]; then
    echo "ERROR: Input is empty."
    exit 1
  fi

  # Check if directory is absolute
  if [[ $dir =~ "~" ]]; then
    echo "ERROR: Relative paths are not allowed. ('$dir')"
    exit 1
  fi

  # Check if directory exists OR file exists
  if [ ! -d "$dir" ] && [ ! -f "$dir" ]; then
    echo "ERROR: Path to directory/file does not exist."
    exit 1
  fi
}

echo "Enter the ABSOLUTE directory path of your Git repositories: (e.g. '/Users/me/work/')"
echo ""
read root_dir
validate $root_dir
echo ""

echo "Enter the ABSOLUTE file-path to the 'clean_git_repositories.sh' script:"
echo "(e.g. /Users/me/scripts/clean_git_repositories.sh)"
echo ""
read script_path
echo ""
validate $script_path

echo "> Adapting LaunchAgent with your paths ..."
echo ""
sed -i 0 "s+/path/to/your/script+$script_path+g" at.orgler.gitclean.plist
sed -i 0 "s+/your/git/root/directory+$root_dir+g" at.orgler.gitclean.plist

# sed keeps a backup with the suffix 0 --> delete it
rm at.orgler.gitclean.plist0

echo "> Copying Launch agent to '~/Library/LaunchAgents' ..."
cp -f at.orgler.gitclean.plist ~/Library/LaunchAgents/
launchctl load -F ~/Library/LaunchAgents/at.orgler.gitclean.plist
echo ""
echo "> Installation completed!"
echo ""