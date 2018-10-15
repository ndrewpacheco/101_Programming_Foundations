hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []
hsh.each_value do |value|
  value.each do |item|
    vowels << item.scan(/[aeiou]/)
  end
end

vowels.each {|v| puts v}




