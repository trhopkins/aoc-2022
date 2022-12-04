#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 4 part 2

BEGIN {
	FS = "[-,]"
	total = 0
}

{
	total += $1 > $4 || $2 < $3 ? 0 : 1
}

END {
	print total
}

