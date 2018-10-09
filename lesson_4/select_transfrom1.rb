produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(str)
  selected_fruit = {}
 
  str.each do |key, value|
    selected_fruit[key] = value if value == 'Fruit'  
  end
selected_fruit
end


select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}