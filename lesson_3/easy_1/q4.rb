numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
p numbers
numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
p numbers
# delete_at will only delete the item at the specific index listed as the arg.
#delete will delete any instance of the argument throughout the array