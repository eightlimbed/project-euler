# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#
# Hence the first 12 terms will be:
#
#     F1 = 1
#     F2 = 1
#     F3 = 2
#     F4 = 3
#     F5 = 5
#     F6 = 8
#     F7 = 13
#     F8 = 21
#     F9 = 34
#     F10 = 55
#     F11 = 89
#     F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the
# Fibonacci sequence to contain 1000 digits?

def fibs(n) # returns the last digit of the nth fib sequence
  fibs = [1, 1]
    (2..n).each do |num|
      fibs << (fibs[num-1] + fibs[num-2])
    end
  fibs[-1]
end


# find the first fibs value that is > 1000 digits
index = 1
loop do
  last_fib = fibs(index)
  # important: incrementor must be above break
  index += 1
  break if last_fib.to_s.size >= 1000
end

p index
# => 4782
