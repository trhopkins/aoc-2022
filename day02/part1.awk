#!/usr/bin/awk -f

# Advent of Code 2022
# Travis Reid Hopkins
# day 2 part 1

BEGIN { score = 0 }
/A X/ { score += 4 }
/A Y/ { score += 8 }
/A Z/ { score += 3 }
/B X/ { score += 1 }
/B Y/ { score += 5 }
/B Z/ { score += 9 }
/C X/ { score += 7 }
/C Y/ { score += 2 }
/C Z/ { score += 6 }
END { print score }

