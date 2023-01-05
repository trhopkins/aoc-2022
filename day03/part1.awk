#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 3 part 1

BEGIN {
	for (byte=0; byte<256; byte++) {
		ord[sprintf("%c", byte)] = byte # ord : char -> int. Yeah, I know it's fucked up
	}
	total = 0
}

function priority(char) {
	return ord[char] >= 97 ? ord[char] - 96 : ord[char] - 38 # lowercase = 1-26, uppercase = 27-52
}

{
	middle = length() / 2
	for (left=1; left<=middle; left++) {
		for (right=middle+1; right<=length(); right++) {
			if (substr($0, left, 1) == substr($0, right, 1)) {
				duplicate = substr($0, right, 1)
			}
		}
	}
	total += priority(duplicate)
}

END {
	print total
}

