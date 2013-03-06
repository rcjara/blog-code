class Counter
  attr_reader :count

  def initialize
    reset!
  end

  def inc
    @count += 1
  end

  def reset!
    @count = 0
  end
end

c = Counter.new

puts "The count is: #{c.count}"

c.inc
c.inc

puts "The count went up to: #{c.count}"

begin
  c.count = 3.14159
rescue NoMethodError => e
  puts "The counter doesn't have that method"
end

puts "The count is still: #{c.count}"

#however, this does work
c.instance_variable_set(:@count, 3.14159)

puts "The count is now: #{c.count}"
