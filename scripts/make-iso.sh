#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

pushd "$scriptDir/.."

git add .
nix run nixpkgs#nixos-generators -- --format iso --flake ./#portable-64 -o result

popd