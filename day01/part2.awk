#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 2 part 2

BEGIN {
	RS = "\n\n";
	first = 0;
	second = 0;
	third = 0;
}

{
	elf_calories = 0;
	for (i=1; i<=NF; i++) {
		elf_calories += $i;
	}
	if (elf_calories >= first) {
		third = second;
		second = first;
		first = elf_calories;
	}
	else if (elf_calories >= second) {
		third = second;
		second = elf_calories;
	}
	else if (elf_calories >= third) {
		third = elf_calories;
	}
}

END {
	top_three_sum = first + second + third;
	print top_three_sum;
}

