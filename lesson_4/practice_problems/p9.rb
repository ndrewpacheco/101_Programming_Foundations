words = "the flintstones rock"

# def titleize(words) 
#   words_array = words.split
#   words_array.each { |word| word.capitalize!}
#   words_array.join(" ")
# end


def titleize(words) 
  words.split.map { |word| word.capitalize!}.join(" ")
end

titleize(words)