#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 4 part 1

BEGIN { FS = "[-,]"; total = 0 }

{ if (($1 == $3 || $2 == $4) || ($1 < $3 && $2 > $4) || ($1 > $3 && $2 < $4)) total++ }

END { print total }

