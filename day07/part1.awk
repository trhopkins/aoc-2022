#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 7 part 1

BEGIN {
	# note to future self: find way of cleaning this representation up? fix
	# need to delete first element when splitting by SUBSEP, try replacing
	# with whitespaces, parse paths differently in general?
	path = "/"
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
}

END {
	total = 0
	# cute visual display
	#PROCINFO["sorted_in"] = "@ind_str_asc" # for easier viewing
	for (path in size) {
		#print path, size[path]
		if (size[path] <= 100000) {
			total += size[path]
		}
	#}
	print total
}

