def double_numbers!(numbers)
 
  numbers.map!{ |number| number * 2}

numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers