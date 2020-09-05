#!/bin/bash
set -e
set -o pipefail

ERRORS=()

# find all executables and run `shellcheck`

while IFS= read -r -d '' infile
do
	if file "$infile" | grep --quiet shell; then
		{
			shellcheck "$infile" && echo -e "\\e[32m[OK]: linted $infile\\e[0m"
		} || {
			# add to errors
			ERRORS+=("$infile")
		}
	fi
done <   <(find . -type f -not -path '*.git*' -not -name "README.md" -print0 | sort -u)

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "No errors in tests"
else
	echo -e "\\e[31mThese files failed shellcheck: ${ERRORS[*]}\\e[0m"
	exit 1
fi
