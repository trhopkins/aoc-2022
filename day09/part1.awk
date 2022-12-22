#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 9 part 1

# track covered spaces with covered[], functions for all motions

BEGIN { head_x = head_y = tail_x = tail_y = 0 }

function left() {
	# check if tail is right of head. If so, move tail. If tail is below or
	# above, move further
	if (tail_x > head_x) {
		tail_x--
		if (tail_y > head_y) {
			tail_y--
		}
		else if (tail_y < head_y) {
			tail_y++
		}
	}
	covered[tail_x, tail_y] = 1
	head_x--
}

function right() {
	if (tail_x < head_x) {
		tail_x++
		if (tail_y > head_y) {
			tail_y--
		}
		else if (tail_y < head_y) {
			tail_y++
		}
	}
	covered[tail_x, tail_y] = 1
	head_x++
}

function up() {
	if (tail_y < head_y) {
		tail_y++
		if (tail_x > head_x) {
			tail_x--
		}
		else if (tail_x < head_x) {
			tail_x++
		}
	}
	covered[tail_x, tail_y] = 1
	head_y++
}

function down() {
	if (tail_y > head_y) {
		tail_y--
		if (tail_x > head_x) {
			tail_x--
		}
		else if (tail_x < head_x) {
			tail_x++
		}
	}
	covered[tail_x, tail_y] = 1
	head_y--
}

/L/ { for (i=1; i<=$2; i++) { left() } }

/R/ { for (i=1; i<=$2; i++) { right() } }

/U/ { for (i=1; i<=$2; i++) { up() } }

/D/ { for (i=1; i<=$2; i++) { down() } }

END { print length(covered) }

