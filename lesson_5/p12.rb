arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_hash = {}

arr.each do |item|
 new_hash[item[0]] = item[1]
end

new_hash

