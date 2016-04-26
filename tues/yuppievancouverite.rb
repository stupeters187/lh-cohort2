def rent?(furnished, baller, rent)
  (baller && furnished) || rent < 2100 ? true : false
end

puts rent?(true, false, 2100)
puts rent?(true, true, 2100)
puts rent?(true, false, 1000)
