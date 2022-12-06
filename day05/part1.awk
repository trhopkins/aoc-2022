#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 5 part 1

BEGIN {
	FS = "" # will be changed later during move operations
	for (i=1; i<=9; i++) {
		top[i] = front[i] = rear[i] = 0
	}
}

function push(s, c) {
	tmp = ++top[s]
	stack[s,tmp] = c
}

function pop(s) {
	tmp = top[s]--
	return stack[s,tmp]
}

function enqueue(q, c) {
	tmp = front[q]++
	queue[q,tmp] = c
}

function dequeue(q) {
	tmp = rear[q]++
	return queue[q,tmp]
}

# add all cargo to stacks
/\[/ {
	for (i=1; i<=9; i++) {
		cargo = $((i-1)*4 + 2)
		if (cargo != " ") {
			push(i, cargo)
		}
	}
}

# flip each stack with a queue (ugly ik but it's single-pass by line)
/^$/ {
	for (i=1; i<=9; i++) {
		while (top[i] != 0) {
			enqueue(i, pop(i))
		}
		while (rear[i] != front[i]) {
			push(i, dequeue(i))
		}
	}
	FS = " " # for move operations later
}

# for each move operation, pop and push the correct quantity
/^move/ {
	for (i=1; i<=$2; i++) { # $2 = quantity
		push($6, pop($4)) # $4 = src, $6 = dst
	}
}

# print top of each stack
END {
	for (i=1; i<=9; i++) {
		printf("%c", pop(i))
	}
}

