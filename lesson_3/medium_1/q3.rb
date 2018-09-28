# def factors(number)
#   dividend = number
#   divisors = []
#   if number == 0 
#     puts "will not work"
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end

# p factors(32)
# p factors(0)

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end  
  divisors
end


p factors(32)
p factors(0)