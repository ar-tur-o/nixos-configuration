#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
me=$(whoami)

pushd "$scriptDir/.."

sudo --user="$me" git add .
nix fmt
echo "Enter the hostname:"
read -p "sudo nixos-rebuild switch --flake ./#" host
sudo --user="$me" nixos-rebuild switch --flake ./#$host 
echo "The following files were changed:"
git status --short

popd