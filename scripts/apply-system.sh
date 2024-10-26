#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

pushd "$scriptDir/.."

sudo git add .
nix fmt
sudo nixos-rebuild switch --show-trace --flake ./#$(hostname) 
echo "The following files were changed:"
git status --short

popd
