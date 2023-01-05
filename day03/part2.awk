#!/usr/bin/awk -f

# Advent of Code
# Travis Reid Hopkins
# day 3 part 2

BEGIN {
	for (byte=0; byte<256; byte++) {
		ord[sprintf("%c", byte)] = byte # ord : char -> int. Yeah I know it's fucked up
	}
	total = 0
}

function priority(char) {
	return ord[char] >= 97 ? ord[char] - 96 : ord[char] - 38 # lowercase = 1-26, uppercase = 27-52
}

{
	first = $0
	getline # because I can't make three-line records without a unique record separator
	second = $0
	getline
	third = $0
	matches = ""
	for (i=1; i<=length(first); i++) {
		char = substr(first, i, 1)
		if (index(second, char) != 0 && index(matches, char) == 0) {
			matches = matches char # yes, this string concatenation is invisible
		}
		if (index(third, char) != 0 && index(matches, char) == 0) {
			matches = matches char
		}
	}
	for (i=1; i<=length(second); i++) {
		char = substr(second, i, 1)
		if (index(third, char) != 0 && index(matches, char)) {
			badge = char
		}
	}
	total += priority(badge)
}

END {
	print total
}

