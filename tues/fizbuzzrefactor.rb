def fizzbuzz(num1, num2)
  num1.upto(num2) do |i|
    if i % 5 == 0 && i % 3 == 0
      puts "FizzBuzz"
    elsif i % 5 == 0
      puts "Buzz"
    elsif i % 3 == 0
      puts "Fizz"
    else
      puts i
    end
  end
end

fizzbuzz(500, 600)
