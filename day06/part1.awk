#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 6 part 1

# one of my worst functions ever, leaving this in here to show how much of an
# idiot I am. All this because AWK's loops don't scope properly. I think???
function nope(s) {
	a = substr(s, 1, 1)
	b = substr(s, 2, 1)
	c = substr(s, 3, 1)
	d = substr(s, 4, 1)
	return a != b && a != c && a != d && b != c && b != d && c != d ? 1 : 0 # now let's see it with 14 vars!
}

function no_dups(s) {
	res = ""
	for (k=1; k<=length(s); k++) { # try replacing k with i. It will overwrite the outer i from 
		for (j=k+1; j<=length(s); j++) {
			if (substr(s, k, 1) == substr(s, j, 1)) {
				res = res substr(s, k, 1) # "It seemed like a good idea at the time." -Brian Khernigan
			}
		}
	}
	return !res # "" is "false" in AWK, so "invert" (!) gives 0 or 1
}

function first_dup(s) {
	for (i=4; i<length($0); i++) {
		if (no_dups(substr($0, i-3, 4))) {
			return i
		}
	}
}

NR == 1 {
	print first_dup($0)
}

