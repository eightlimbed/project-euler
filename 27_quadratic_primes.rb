# Euler discovered the remarkable quadratic formula:
#
# n^2 + n + 41
#
# It turns out that the formula will produce 40 primes for the
# consecutive integer values 0 ≤ n ≤ 39.
#
# However, when n = 40, 40^2 + 40 + 41 = 40(40+1) + 41 is divisible by 41
# and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
#
# The incredible formula n^2 − 79n + 1601 was discovered,
# which produces 80 primes for the consecutive values 0 ≤ n ≤ 79.
#
# The product of the coefficients, −79 and 1601, is −126479.
#
# Considering quadratics of the form:
#
#     n^2 + an + b, where |a| < 1000 and |b| ≤ 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
#
# Find the product of the coefficients, a and b, for the quadratic
# expression that produces the maximum number of primes for
# consecutive values of n, starting with n = 0.

def prime?(n) # true of false, n is prime.
  return false if n < 1
  return true if n == 1
  (2..(n/2)).each do |d|
    return false if n % d == 0
  end
  true
end

num_of_primes = 0
product = 0

(-1000..1000).each do |a|
  (1..1000).each do |b|
    n = 0
    while prime?(( n ** 2 ) + ( a * n ) + b)
      n += 1
    end
      if (n > num_of_primes)
        num_of_primes = n
        product = a * b
      end
  end
end

p product
# => -59231
