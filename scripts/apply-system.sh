#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

pushd "$scriptDir/.."

sudo git add .
nix fmt
name=${1:-$(hostname)}
sudo nixos-rebuild switch --show-trace --flake ./#$name 
echo "The following files were changed:"
git status --short

popd
