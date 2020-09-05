#!/bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	# shellcheck source=/dev/null
	source /etc/bashrc
fi

# User specific aliases and functions

export PATH=$PATH:/usr/local/go/bin
