def has_sin?(string)
  
  !(string.match(/(\b)(\d{3})-(\d{3})-(\d{3})(\b)/).nil?)
end

puts "has_sin? returns true if it has what looks like a SIN"
puts has_sin?("please don't share this: 234-604-142") == true

puts "has_sin? returns false if it doesn't have a SIN"
puts has_sin?("please confirm your identity: XXX-XXX-142") == false
puts has_sin?("please don't share this: 234-6043-142") == false
puts has_sin?("please don't share this: 2342-604-142") == false
puts has_sin?("please don't share this: 234-604-1421") == false

def grab_sin(string)
  serach = string.match(/(\w{3}-\w{3}-\w{3})/)
  return serach.to_s if search
end


puts "grab_sin returns an SIN if the string has an SIN"
puts grab_sin("please don't share this: 234-604-142") # == "234-604-142"

puts "grab_sin returns nil if it doesn't have a SIN"
puts grab_sin("please confirm your identity: XXX-XXX-142") == nil


def grab_all_sins(string)
  search = string.scan(/\d{3}-\d{3}-\d{3}/)
  return search if search
  return [] if !search
end

puts "grab_all_sins returns all SINs if the string has any SINs"
puts grab_all_sins("234-604-142, 350-802-074, 013-630-876") == ["234-604-142", "350-802-074", "013-630-876"]

puts "grab_all_sins returns an empty Array if it doesn't have any SINs"
puts grab_all_sins("please confirm your identity: XXX-XXX-142") == []


def hide_all_sins(string)
  search = string.scan(/\d{3}-\d{3}-\d{3}/)
  if search
    string.gsub(/\d{3}-\d{3}/, 'XXX-XXX')
  end
end

puts "hide_all_sins obfuscates any SINs in the string"
puts hide_all_sins("234-601-142, 350-801-074, 013-601-876") == "XXX-XXX-142, XXX-XXX-074, XXX-XXX-876"

puts "hide_all_sins does not alter a string without SINs in it"
string = "please confirm your identity: XXX-XXX-142"
puts hide_all_sins(string) == string


def format_sins(string)
  puts string.gsub!(/\b(\d{3})\D?(\d{3})\D?(\d{3})\b/, '\1-\2-\3')
  return string
end

puts "format_sins finds and reformat any SINs in the string"
puts format_sins("234600142, 350.800.074, 013-600-876") == "234-600-142, 350-800-074, 013-600-876"

puts "format_sins does not alter a string without SINs in it"
string = "please confirm your identity: 4421422"
puts format_sins(string) == string

string = "please confirm your identity: 123abc445"
puts format_sins(string) == string