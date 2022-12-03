#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 3 part 1

BEGIN {
	FS = ""
	for (i=0; i<256; i++) { ord[sprintf("%c", i)] = i } # ord : char -> int. Yeah I know it's fucked up
	total = 0
}

function priority(c) {
	return ord[c] >= 97 ? ord[c] - 96 : ord[c] - 38 # lowercase = 1-26, uppercase = 27-52
}

{
	middle = NF / 2
	for (left=1; left<=middle; left++) {
		for (right=middle+1; right<=NF; right++) {
			if ($left == $right) {
				duplicate = $left
			}
		}
	}
	total += priority(duplicate)
}

END {
	print total
}

