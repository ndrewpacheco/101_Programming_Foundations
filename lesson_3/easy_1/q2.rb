=begin
  

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

  ! can mean NOT when using comparisons. It can also represent that a method is mutating, if the exclaimation
  is after the name. This is not neccessary, and only a convention.

  When a ? is placed after a method, it is a convention, and is usually for testing the truthiness of something. it could also be used
  in a ternary operator.



what is != and where should you use it?

  != is a comparison operator and used for comparing two conditions that are NOT true to each other.



put ! before something, like !user_name

  this would have an effect of NOT username



put ! after something, like words.uniq!
  
  a convention for telling the reader that this method is destructive.


put ? before something

  can be used in ternary statements, before each expression 



put ? after something

  a convention when a condition is u sed to test if something is true or false



put !! before something, like !!user_name

turns any value into boolean equivlent

end