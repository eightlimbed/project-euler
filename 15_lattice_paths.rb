# Starting in the top left corner of a 2×2 grid, and only being able
# to move to the right and down, there are exactly 6 routes to the
# bottom right corner.
#
# How many such routes are there through a 20×20 grid?

# The pattern of Pascal's Triangle emerges in this problem
# After doing some research, I found an equation that we can use
# to expand the Pascal's Triangle pattern up to R
# (the number of rows in the grid)
#
#     2 * R!
#   -----------
#      R!^2
#

class Integer
  def factorial
    (1..self).inject(&:*) # 5.factorial => [1, 2, 3, 4, 5].inject(&:*) => 120
  end
end

grid_size = 20 # (20 x 20)

p (2 * grid_size).factorial / (grid_size.factorial ** 2)
# => 137846528820
