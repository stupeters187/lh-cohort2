def maximum(arr)
  num = arr[0]
  arr.each do |x|
    if num < x
      num = x
    end
  end
  num
end

result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

result = maximum([])
puts "max on empty set is: #{result.inspect}"

result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"

result = maximum([6])
puts "max of just 6 is: #{result}"
