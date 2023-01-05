#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 1 part 1

BEGIN {
	RS = "" # separate records with empty lines
	max_calories = 0
}

{
	elf_calories = 0
	for (i=1; i<=NF; i++) {
		elf_calories += $i
	}
	if (elf_calories > max_calories) {
		max_calories = elf_calories
	}
}

END {
	print max_calories
}

