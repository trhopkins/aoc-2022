#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# question 1

BEGIN {
	RS = "\n\n";
	max = 0;
}

{
	elf_calories = 0;
	for (i=1; i<=NF; i++) {
		elf_calories += $i;
	}
	if (elf_calories > max) {
		max = elf_calories;
	}
}

END {
	print max;
}

