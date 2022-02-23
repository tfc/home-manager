#!/usr/bin/env bash

set -euo pipefail

rm -f result

nix flake update
nix -L build .#homeManagerConfigurations.linux.activationPackage --option substituters https://cache.nixos.org
./result/bin/home-manager-generation



