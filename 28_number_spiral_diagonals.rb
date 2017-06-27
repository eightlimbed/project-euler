# Starting with the number 1 and moving to the right in
# a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a
# 1001 by 1001 spiral formed in the same way?

grid_size = 3  # 3 x 3 grid
count     = 0  # tally to return
upper_right      = 9  # upper-right corner of grid
prev_upper_right = 1  # immediate down and left of upper_right

  until grid_size > 1001
    bottom_right     = prev_upper_right + ( grid_size - 1 )
    bottom_left      = bottom_right     + ( grid_size - 1 )
    upper_left       = bottom_left      + ( grid_size - 1 )

    count += (upper_right + bottom_right + bottom_left + upper_left)

    grid_size   += 2
    prev_upper_right = upper_right
    upper_right += ( grid_size ** 2 - upper_right )
  end

p count + 1
# => 669171001
