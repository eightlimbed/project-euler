# A Pythagorean triplet is a set of three natural numbers,
# a < b < c, for which, a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

result = []
a = 1

# set up a nested loop, check for all unique combinations
# of a, b and c. Then find the one where a+b+c = 1000
# and a^2 + b^2 = C^2.
# i restricted the loop to under 500 because of the condition
# of the sum being 1000, the average of a, b, c is ~ 333.333.
while a < 500
  b = a + 1
  while b < 500
    c = b + 1
    while c < 500
      result = [a, b, c] if (a + b + c) == 1000 && (a**2 + b**2 == c**2)
      c += 1
    end
    b += 1
  end
  a += 1
end

p result.inject(&:*)
# => 31875000

p "a = #{result[0]}\
   b = #{result[1]}\
   c = #{result[2]}\
   a+b+c = #{result.inject(&:+)}\
   The product, abc, = #{result.inject(&:*)}"
