# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

def collatz(num) # returns the size of the collatz sequence starting at num
  n = num
  sequence = [num]
  loop do
    if n.even?
      n = n/2
      sequence << n
    elsif n.odd?
      n = (3*n + 1)
      sequence << n
    end
    break if n == 1
  end
  sequence.size
end

longest = 0
longest_num = nil
i = 1
while i < 1_000_001
  sequence_size = collatz(i)
    if sequence_size > longest
      longest = sequence_size
      longest_num = i
    end
  i += 1
end

p longest_num
# => 837799
