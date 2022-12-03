#!/usr/bin/awk -f

# Advent of Code
# Travis Reid Hopkins
# day 3 part 2

BEGIN {
	FS = ""
	for (i=0; i<256; i++) { ord[sprintf("%c", i)] = i } # ord : char -> int. Yeah I know it's fucked up
	total = 0
}

function priority(c) {
	return ord[c] >= 97 ? ord[c] - 96 : ord[c] - 38 # lowercase = 1-26, uppercase = 27-52
}

{
	first = $0
	getline # because I can't make three-line records without a unique record separator
	second = $0
	getline
	third = $0
	matches = ""
	for (i=1; i<=length(first); i++) {
		c = substr(first,i,1)
		if (index(second, c) != 0 && index(matches, c) == 0) {
			matches = matches c # yes, this append is invisible
		}
		if (index(third, c) != 0 && index(matches, c) == 0) {
			matches = matches c
		}
	}
	for (i=1; i<=length(second); i++) {
		c = substr(second,i,1)
		if (index(third, c) != 0 && index(matches, c)) {
			badge = c
		}
	}
	print matches
	print badge
	total += priority(badge)
}

END {
	print total
}

