#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 8 part 1

BEGIN {
	FS = ""
}

# looking north from the bottom
function north_visible(col) {
	current_highest = -1
	for (row=NR; row>=1; row--) {
		if (tree[row, col] > current_highest) {
			current_highest = tree[row, col]
			if (!(row SUBSEP col in visible)) {
				visible[row, col] = 1
			}
		}
	}
}

# looking south from the top
function south_visible(col) {
	current_highest = -1
	for (row=1; row<=NR; row++) {
		if (tree[row, col] > current_highest) {
			current_highest = tree[row, col]
			if (!(row SUBSEP col in visible)) {
				visible[row, col] = 1
			}
		}
	}
}

# looking west from the right
function west_visible(row) {
	current_highest = -1
	for (col=1; col<=NF; col++) {
		if (tree[row, col] > current_highest) {
			current_highest = tree[row, col]
			if (!(row SUBSEP col in visible)) {
				visible[row, col] = 1
			}
		}
	}
}

# looking east from the left
function east_visible(row) {
	current_highest = -1
	for (col=NF; col>=1; col--) {
		if (tree[row, col] > current_highest) {
			current_highest = tree[row, col]
			if (!(row SUBSEP col in visible)) {
				visible[row, col] = 1
			}
		}
	}
}

# populate tree height table
{
	for (i=1; i<=NF; i++) {
		tree[i, NR] = $i
	}
}

# for each row/column, add all visible trees and print total
END {
	for (i=1; i<=NF; i++) { # assumes square plot of trees
		north_visible(i) # each call mutates visible[]
		south_visible(i)
		east_visible(i)
		west_visible(i)
	}
	print length(visible)
}

