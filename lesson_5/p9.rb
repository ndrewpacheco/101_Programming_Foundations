arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.each do |arr|
  arr.sort!{ |a, b| b <=> a } 
end