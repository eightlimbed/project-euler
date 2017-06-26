# You are given the following information,
# but you may prefer to do some research for yourself.
#
#     1 Jan 1900 was a Monday.
#     Thirty days has September,
#     April, June and November.
#     All the rest have thirty-one,
#     Saving February alone,
#     Which has twenty-eight, rain or shine.
#     And on leap years, twenty-nine.
#     A leap year occurs on any year evenly divisible by 4,
#     but not on a century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the
# twentieth century (1 Jan 1901 to 31 Dec 2000)?

def leap_years(start, ending) # returns an array of leap years from a range
  (start..ending).to_a.select do |year|
    year % 4 == 0
  end
  .reject { |x| x % 400 == 0}
end

def leap_year?(year) # true or false: year is a leap year
  leap_years(1900,2000).include?(year)
end

# Starting on Jan 1 1900 (Monday)
cal_day = 1
wk_day  = 2 # ( 2 = Monday )
month   = 1
year    = 1900

# 30-day months: apr, jun, sep, nov
months_with_30_days = [4, 6, 9, 11]

# First-of-the-month Sunday counter
count = 0

while year < 2001

  count += 1 if ( cal_day == 1 && wk_day == 1 && year > 1900 ) # don't include the year 1900, as per instructions.

  wk_day += 1 # increment week day
  wk_day = 1 if wk_day == 8 # reset to sunday after saturday

  case cal_day
    when 0..27
      cal_day += 1
    when 28 && month == 2 && leap_year?(year)
      cal_day += 1
    when 28 && month == 2 && !leap_year?(year)
      cal_day = 1
      month   = 3
    when 28
      cal_day += 1
    when 29 && month == 2
      cal_day = 1
      month   = 3
    when 29
      cal_day += 1
    when 30 && months_with_30_days.include?(month)
      cal_day = 1
      month  = cal_day + 1
    when 30
      cal_day +=1
    when 31
      cal_day = 1
      month  += 1
      if month == 13
        month = 1
        year += 1
      end
  end
end

p count
# => 171
