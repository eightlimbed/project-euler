# A perfect number is a number for which the sum of its proper divisors
# is exactly equal to the number.
#
# For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28,
# which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors
# is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant
# numbers is 24.
#
# By mathematical analysis, it can be shown that all integers greater
# than 28123 can be written as the sum of two abundant numbers.
# However, this upper limit cannot be reduced any further by analysis
# even though it is known that the greatest number that cannot be expressed
# as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written
# as the sum of two abundant numbers.


def sum_of_factors(n) # returns the sum of factors of n
  result = []
  (1..(n/2)).each do |divisor|
    if n % divisor == 0
      result << divisor
    end
  end
  result.inject(&:+)
end

class Integer
  def abundant? # returns true if a number is abundant (12.abundant? => true)
    sum_of_factors(self) > self
  end
end

max = 28123

# create an array of all abundant numbers up to 28123
# start at 2 to avoid error thrown by line 27
abundant_numbers = (2..max).select { |n| n.abundant? }

result = []

# using a nested loop to add all combinations of two
# abundant numbers in the array. shoveling the sums into
# a result box. breaking the loop if the sum is > 28123
abundant_numbers.each do |x|
  abundant_numbers.each do |y|
    sum = (x + y)
    break if sum > max
    result << sum
  end
end

# create array of number 1-28123
# remove all abundant numbers from that array
# add up all remaining numbers ("deficient numbers")
deficient_numbers = (1..max).to_a - result
puts deficient_numbers.inject(&:+)
# => 4179871
