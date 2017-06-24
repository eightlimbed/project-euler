# 2520 is the smallest number that can be divided by each
# of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible
# by all of the numbers from 1 to 20?

smallest_number = (1..20).inject(&:lcm)

# note: the least common multiple of two numbers, for example 4 and 10
# ( in ruby it's written 4.lcm(10) ) is the smallest number that both
# 4 and 10 both divide into evenly. 4.lcm(10) => 20
# the .inject method takes the lcm of all numbers in the range [1, 2, ... 20]
# returning the smallest number that is evenly divisible by all numbers
# in the range
# [1, 2, 3, 4].inject(&:lcm) => 12
# 1.lcm(1) = 1
# 1.lsm(2) = 2
# 2.lcm(3) = 6
# 6.lcm(4) = 12
# therefore we can solve this problem very simply with ruby's inject
# and lcm methods

p smallest_number
# => 232792560
