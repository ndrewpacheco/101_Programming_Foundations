
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |item|
   item.transform_values {|v| v += 1}
end

arr