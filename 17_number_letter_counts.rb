# If the numbers 1 to 5 are written out in words:
# one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive
# were written out in words, how many letters would be used?
#
# Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters
# and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is
# in compliance with British usage.


count = 0

# ones digits
one_upto_nine = ["one", "two", "three", "four", "five", "six", \
"seven", "eight", "nine"].map { |word| word.size }.inject(&:+)
# => 36

count += 36

# 10-teens
ten_upto_nineteen = ["ten", "eleven", "twelve", "thirteen", "fourteen", \
"fifteen", "sixteen", "seventeen", "eighteen", \
"nineteen"].map { |word| word.size }.inject(&:+)
# => 70

count += 70

# tens digits
twenty_upto_ninety = ["twenty", "thirty", "forty", "fifty", \
"sixty", "seventy", "eighty", "ninety"].map { |word| word.size }.inject(&:+)
# => 46

count += (10 * 46) + (8 * 36) # numbers 20-99
# total so far is 854 (number 1-99)

# numbers 100-999
# 1-9 occurs 100 times each
count += (100 * 36)
# 1-99 occurs 9 times each
count += (9 * 854)
# "hundred and" (10 letters) occurs 99 times each
# for 9 of the hundred-digit numbers
count += (9 * 99 * 10)
# "hundred" (7 letters) occurs 9 times
count += (9 * 7)
# finally, add "one thousand" (11 letters)
count += 11

p count
# => 21124
