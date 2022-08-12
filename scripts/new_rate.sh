#!/bin/bash

# ---------------------------------------------------------------------------
# new_rate - Create a new Hugo page with the archetype of (etch) rate.

# Standard variables
PROGNAME=${0##*/}
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

# Error handling
error_exit() {
  local error_message="${red}$1${reset}"

  printf "%s\n" "${PROGNAME}: ${error_message:-"Unknown Error"}" >&2
  exit 1
}

graceful_exit() {
  exit 0
}

# Program variables
filename=$1
if [[ ! $filename ]]; then
  usage >&2
  error_exit "Name of new etch rate must be provided."
fi

# Home directory
here=$(pwd)

# Set variable defaults.
kind="rate"
path="etch-rates"
hugo_content="content"
git_file=".gitkeep"

# Run commands
printf "%s\n" ""
printf "%s\n" "${cyan}Creating etch rate page...${reset}"
node_modules/.bin/hugo/hugo new --kind $kind $path/"$filename"
rm $hugo_content/$path/"$filename"/images/$git_file
cd "$here" || exit
printf "%s\n" "${cyan}                          ...done.${reset}"
