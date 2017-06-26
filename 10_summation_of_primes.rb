# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

def prime?(n) # true of false: n is prime?
  (2..Math.sqrt(n)).each do |divisor|
    return false if n % divisor == 0
  end
  true
end

def sum_of_primes(n) # returns the sum of all prime numbers below n
  output = []
  (2..n).each do |divisor|
    output << divisor if prime?(divisor)
  end
  output.inject(&:+)
end

# p sum_of_primes(2_000_000)
# => 142913828922

# The solution above took ~ 37 seconds to return.
# I did some research and found about the sieve of Eratostheses
# Ruby has Prime::EratosthenesGenerator method, but I was told
# not to use any libraries, like Prime.
# The method below is based on Eratostheses' sieve:

def sieve(max) # returns the sum of all prime numbers below n
  primes = (0..max).to_a
  primes[0] = primes[1] = nil

  primes.each do |p|
    next unless p # skips over nil values in the array
    break if p*p > max # no need to go beyond p*p because the factors
                       # pivot around the square root.
                       # one is smaller, one is bigger
                       # if the smaller one doesn't exist
                       # there is no matching one larger than the sqrt
    (p*p).step(max,p) { |m| primes[m] = nil }
    # the line above says: "starting at p*p",
    # step to max, by steps the size of p,
    # each time you step, change the value of
    # the array (primes) at the step to nil
  end
  primes.compact.inject(&:+) # deletes all nil values then sums it all up
end

p sieve(2_000_000)
# => 142913828922
