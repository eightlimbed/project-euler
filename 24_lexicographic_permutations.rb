# A permutation is an ordered arrangement of objects.
# For example, 3124 is one possible permutation of
# the digits 1, 2, 3 and 4.
#
# If all of the permutations are listed numerically or alphabetically,
# we call it lexicographic order.
#
# The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation
# of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?


# we can just use the permutation ruby method
# then take the value at index 999_999
perms = (0..9).to_a.permutation(10).to_a

# had to .join it to get to format Euler wanted
p perms[999_999].join.to_i
# => "2783915460"
