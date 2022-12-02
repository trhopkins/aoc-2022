#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 2 part 2

BEGIN { score = 0; }
/A X/ { score += 3; }
/A Y/ { score += 4; }
/A Z/ { score += 8; }
/B X/ { score += 1; }
/B Y/ { score += 5; }
/B Z/ { score += 9; }
/C X/ { score += 2; }
/C Y/ { score += 6; }
/C Z/ { score += 7; }
END { print score; }

