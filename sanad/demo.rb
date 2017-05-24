

# first ruby script

module UsefulFeatures
  def class_name
    # use self keyword to infer the current class
    self.class.to_s
  end
end


class Person
  include UsefulFeatures

end

x = Person.new
puts x.class_name


puts "========================"

my_array = %w{this is a test of the longest word check}
longest_word = ''
my_array.each do |item|
  longest_word = item if item.length > longest_word.length

end

puts "Longest word is : #{longest_word}"

