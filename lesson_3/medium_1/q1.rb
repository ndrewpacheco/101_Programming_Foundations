# def print_flintstones(statment) 
#   10.times do
#     puts statment
#     statment.prepend(" ")
#   end
# end

# print_flintstones("The Flintstones Rock!")

# above works, but not one line

10.times {|number| puts (" " * number) + "The Flintstones Rock!"}