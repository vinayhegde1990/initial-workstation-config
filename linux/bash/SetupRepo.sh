#!/bin/bash

# Create Symlinks to Shell Aliases from this repo under the "$HOME" directory

GIT_REPO_DIR="$1"

function CreateAliasSymLinks() {
	for alias_files in $($(command -v ls) -1 "$GIT_REPO_DIR/linux/bash/aliases/"); do
		$(command -v ln) -vsf "$GIT_REPO_DIR"/linux/bash/aliases/"$alias_files" "$HOME"/aliases/."$alias_files"
	done
}
