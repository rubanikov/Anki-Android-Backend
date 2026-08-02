#!/bin/bash

set -e

# Resolve both paths from the repository root rather than by hopping up with `..`.
#
# `anki/` may be a junction or symlink to a checkout living outside this repo.
# When it is, the shell reports the logical path but cargo resolves the physical
# one, so `../../../Cargo.toml` from `anki/cargo/format` lands outside the
# repository and the hook dies with a manifest-not-found error.
root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

(cd "$root/anki/cargo/format" && cargo fmt --all --manifest-path "$root/Cargo.toml")
