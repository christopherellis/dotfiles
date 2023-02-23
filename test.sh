#!/bin/bash
set -e
set -o pipefail

ERRORS=()


# run shellcheck on executables
for f in $(find . -type f -not -path '*.git*' -not -name "README.md" | sort -u); do
	if file "$f" | grep --quiet shell; then
		{
			shellcheck "$f" && echo "[OK]: successfully linted $f"
		} || {
			ERRORS+=("$f")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "No errors"
else
	echo -e "\\e[31mThese files failed shellcheck: ${ERRORS[*]}\\e[0m"
	exit 1
fi
