# A palindromic number reads the same both ways.
# The largest palindrome made from the product of
# two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

result = []

# a nested loop to multiply every combination of two three-digit numbers
(100...1000).each do |num1|
  (100...1000).each do |num2|
    # check for palindromes and shovel them into our result box
    if (num1 * num2).to_s == (num1 * num2).to_s.reverse
      result << (num1 * num2)
    end
  end
end

# find the largest one
largest_palindrome = result.max

p largest_palindrome
# => 906609
