counter = (-> do
  pub = {}
  count = 0

  pub[:reset]     = -> { count = 0 }
  pub[:inc]       = -> { count += 1 }
  pub[:get_count] = -> { count }

  pub
end).call

puts "The count is: #{ counter[:get_count].call }"

counter[:inc].call
counter[:inc].call

puts "The count went up to: #{ counter[:get_count].call }"

begin
  counter.instance_variable_set(:count, 3.14159)
rescue NameError => e
  puts "Instance variables have to start with the '@' symbol"
end

counter.instance_variable_set(:@count, 3.14159)

puts "The count is still: #{ counter[:get_count].call }"

counter[:reset].call

puts "The count is now: #{ counter[:get_count].call }"


# Which all seems great except  ...
puts "It is a lambda" if counts[:inc].lambda?

puts "But it is also Proc" if counter[:inc].class == Proc

puts "And it therefore has a binding!" if counter[:inc].binding

binding_count = eval("count", counter[:inc].binding)
puts "Accessing the count through the binding: #{ binding_count }"

eval("count = 3.14159", counter[:inc].binding)
puts "The count is now: #{ counter[:get_count].call }"
