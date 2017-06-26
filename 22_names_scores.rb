# Using names.txt (right click and 'Save Link/Target As...'),
# a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order.
# Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position
# in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order,
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the
# 938th name in the list.
#
# So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

# create an array of sorted names from the text file
names = File.read('names.txt')
names = names.split(",")
names = names.map { |x| x.scan(/\w/).join }
names = names.sort

# convert names into scores
# i used .ord - 64 to get "A" = 1, "B" = 2, etc.
# then sum the scores of each letter
names_scores = []
(0...names.size).each do |i|
  names_scores << names[i].split(//).map{ |char| char.ord - 64 }.inject(&:+)
end

# multiply the score * the placement in the array
names_scores =
(0...names_scores.size).map do |i|
  names_scores[i] *= (i+1)
end

# add up all the scores
p names_scores.inject(&:+)
# => 871198282
