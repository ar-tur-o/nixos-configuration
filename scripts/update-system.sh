#!/bin/sh

set -e
scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

pushd "$scriptDir/.."

# updates flake.lock
nix flake update

bash "$scriptDir/apply-system.sh"

popd