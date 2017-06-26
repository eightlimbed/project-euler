# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10!
# is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!


def factorial(num) # returns the factorial of a number
  (1..num).inject(&:*)
end

# take the factorial of 100
sum = factorial(100)

# then convert it to a string
sum = sum.to_s

# then split the string into an array
sum = sum.split(//)

# then convert the strings into integers
sum = sum.map(&:to_i)

# then sum the individual numbers
sum = sum.inject(&:+)

p sum
# => 648
