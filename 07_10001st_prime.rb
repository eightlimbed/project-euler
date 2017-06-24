# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
#
# What is the 10001st prime number?

def prime?(n) # helper method that returns true or false if a number is prime
  return false if n < 2
  (2..Math.sqrt(n)).each do |divisor|
    if n % divisor == 0
      return false
    end
  end
  true
end

primes = []
n = 2
# loop until we get to 10001 prime numbers in the 'primes' box
until primes.size == 10001
  primes << n if prime?(n)
  n += 1
end

p primes.last
# => 104743
