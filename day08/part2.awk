#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 8 part 2

BEGIN {
	FS = ""
	max = 0
}

# looking north
function north_visible(x, y) {
	treehouse_height = tree[x, y]
	distance = 0
	y--
	while (x SUBSEP y in tree && treehouse_height > tree[x, y]) {
		y--
		distance++
	}
	if (x SUBSEP y in tree) {
		distance++
	}
	return distance
}

# looking north
function south_visible(x, y) {
	treehouse_height = tree[x, y]
	distance = 0
	y++
	while (x SUBSEP y in tree && treehouse_height > tree[x, y]) {
		y++
		distance++
	}
	if (x SUBSEP y in tree) {
		distance++
	}
	return distance
}

# looking north
function east_visible(x, y) {
	treehouse_height = tree[x, y]
	distance = 0
	x++
	while (x SUBSEP y in tree && treehouse_height > tree[x, y]) {
		x++
		distance++
	}
	if (x SUBSEP y in tree) {
		distance++
	}
	return distance
}

# looking north
function west_visible(x, y) {
	treehouse_height = tree[x, y]
	distance = 0
	x--
	while (x SUBSEP y in tree && treehouse_height > tree[x, y]) {
		x--
		distance++
	}
	if (x SUBSEP y in tree) {
		distance++
	}
	return distance
}

# calculate score for one tree
function scenic_score(row, col) {
	return north_visible(row, col) * south_visible(row, col) * east_visible(row, col) * west_visible(row, col) 
}

# populate tree height table
{
	for (x=1; x<=NF; x++) {
		tree[x, NR] = $x
	}
}

# get the max scenic score of each tree
END {
	for (y=1; y<=NR; y++) {
		for (x=1; x<=NF; x++) {
			score = scenic_score(x, y)
			if (score > max) {
				max = score
			}
		}
	}
	print max
}

