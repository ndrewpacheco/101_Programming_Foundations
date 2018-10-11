statement = "The Flintstones Rock"

counter = 0

state_hash = {}

loop do 
  key = statement[counter]

  if state_hash.has_key?(key)
  state_hash[key] += 1
  else
   state_hash[key] = 1 
    end
  counter += 1
  break if statement.size < counter
end

state_hash.select!{|k,v| k =~ /[[:alpha:]]/}
state_hash
