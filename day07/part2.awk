#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 7 part 2

BEGIN {
	path = "/"
	total = 0
}

# go to parent directory
/^\$ cd \.\.$/ {
	path_len = split(path, path_arr, SUBSEP)
	path = "/"
	delete path_arr[1] # remove first element (duplicate SUBSEP???)
	delete path_arr[path_len] # remove last element
	for (i in path_arr) {
		path = path SUBSEP path_arr[i]
	}
}

# go to subdirectory
/^\$ cd [a-z]+/ {
	path = path SUBSEP $3
}

# file size. Add to all directories in current path
/^[0-9]+/ {
	path_len = split(path, path_arr, SUBSEP)
	path = "/"
	delete path_arr[1] # remove first element (duplicate SUBSEP???)
	for (i in path_arr) {
		if (!(path in size)) {
			size[path] = 0
		}
		path = path SUBSEP path_arr[i]
		size[path] += $1 # add this file's size to each ancestor
	}
	total += $1 # using this since size["/"] doesn't work for stupid reasons (me)
}

END {
	current_best = 70000000
	for (path in size) {
		if (total - size[path] <= 40000000 && size[path] <= current_best) {
			current_best = size[path]
		}
	}
	print current_best
}

