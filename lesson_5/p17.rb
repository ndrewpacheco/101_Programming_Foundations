


# def uuid
#   hex_arr = (0..9).to_a + ("a".."z").to_a

#   uuid1 = hex_arr.sample(8) << "-" 
#   uuid1 += hex_arr.sample(4) << "-" 
#   uuid1 += hex_arr.sample(4) << "-"
#   uuid1 += hex_arr.sample(4) << "-"
#   uuid1 += hex_arr.sample(12)
#   uuid1.join
# end

# uuid



def uuid
  hex_arr = (0..9).to_a + ("a".."z").to_a
  uuid1 = []

  sections = [8, 4, 4, 4, 12]

  sections.each {|section| uuid1 += hex_arr.sample(section) << "-" } 
  
  uuid1.pop
  uuid1.join
end

uuid