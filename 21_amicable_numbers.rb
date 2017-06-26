# Let d(n) be defined as the sum of proper divisors of n
# (numbers less than n which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are
# an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284.
#
# The proper divisors of 284 are 1, 2, 4, 71 and 142;
# so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.


def sum_of_factors(n) # returns the sum of proper divisors (factors)
  result = []
  (1..(n/2)).each do |divisor|
    if n % divisor == 0
      result << divisor
    end
  end
  result.inject(&:+)
end

amicable_numbers = []

(2...10_000).each do |num| # start at 2 to avoid error in line 19
  if num == sum_of_factors(sum_of_factors(num)) && \
     num != sum_of_factors(num)
     amicable_numbers << num << sum_of_factors(num)
  end
end

# remove repeat numbers, then sum them all together
p amicable_numbers.uniq.inject(&:+)
# => 31626
