#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 2 part 1

function no_dups(s) {
	res = ""
	for (k=1; k<=length(s); k++) {
		for (j=k+1; j<=length(s); j++) {
			if (substr(s, k, 1) == substr(s, j, 1)) {
				res = res substr(s, k, 1) # "It seemed like a good idea at the time." -Brian Khernigan
			}
		}
	}
	return !res # "" is "false" in AWK, so "invert" (!) gives 0 or 1
}

function first_dup(s) {
	for (i=14; i<length($0); i++) {
		if (no_dups(substr($0, i-13, 14))) {
			return i
		}
	}
}

NR == 1 {
	print first_dup($0)
}

