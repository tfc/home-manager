#!/usr/bin/env bash

set -euo pipefail

rm -f result

nix flake update
nix build .#homeManagerConfigurations.linux.activationPackage
./result/bin/home-manager-generation



