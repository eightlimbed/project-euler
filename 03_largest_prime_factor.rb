# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

def prime?(n) # helper method that returns true or false if a number is prime
  return false if n < 2
  (2..Math.sqrt(n)).each do |divisor|
    if n % divisor == 0
      return false
    end
  end
  true
end

def factors(n) # returns an array of factors of n
  (2..Math.sqrt(n)).select { |x| n % x == 0 }
  # note: used Math.sqrt(n) instead of n/2 for speed purposes
  # if a factor is greater than sqrt(n), it's partner factor is
  # necessarily less than sqrt(n)
  # ex: sqrt(20) = 4.5
  # factors of 20: 2, 4, 5, 10
  # pairs of factors of 20: [2, 10], [4, 5]
  # the min of those pairs will be <= sqrt(20)
end

def prime_factors(n) # returns an array of prime factors
  factors = factors(n)
  factors.select { |x| prime?(x) }
end

def largest_prime_factor(n) # returns the largest prime factor in the array
  prime_factors(n).max
end

p largest_prime_factor(600851475143)
# => 6857
