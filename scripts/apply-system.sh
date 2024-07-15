#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
me=$(whoami)

pushd "$scriptDir/.."

sudo --user="$me" git add .
nix fmt
sudo --user="$me" nixos-rebuild switch --flake ./#$(hostname) 
echo "The following files were changed:"
git status --short

popd
