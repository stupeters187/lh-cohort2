require 'pry'
def count_letters(string)

  container = Hash.new(0)

  words = string.split(" ")
  words.each do |word|
    letters = word.split("")
    letters.each do |letter| 
      # Does the hash contain this letter? 
      if container[letter]
      # If it does you want to set the value for key (letter) to increment 1
        count = container[letter]
        count += 1
        container[letter] = count 
      # else if it does not
      else
      # create a key value pair with the value being 1 and the key being the letter.
        container[letter] = 1 
      end
    end
  end

  puts container
end

count_letters("Stu stu")


# .map(&:strip).to_s.chomp