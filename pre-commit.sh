#! /usr/bin/env nix-shell
#! nix-shell -i bash -p haskellPackages.cabal-fmt fourmolu hlint
set -e

staged_files() {
	local pattern="$1"
	git diff --cached --name-only --diff-filter=ACM | grep "$pattern" || true
}

process_staged_files() {
	local pattern="$1"
	shift
	local files
	files=$(staged_files "$pattern")

	if [[ -n "$files" ]]; then
		echo "Processing files: $files"
		for cmd in "$@"; do
			echo "Running: $cmd"
			echo "$files" | xargs $cmd
		done
	fi
}

# cabal: fmt
process_staged_files '\.cabal$' 'cabal-fmt -i' 'git add'

# haskell: fmt + lint
process_staged_files '\.hs$' 'fourmolu -i' 'git add' 'hlint'

# check build completion
nix build
