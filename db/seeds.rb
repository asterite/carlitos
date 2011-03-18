Food.delete_all

{"HAMBURGUESAS" =>
   {"_" => [
           ["1- Sola", "10.00"],
           ["2- Con queso o tomate", "12.00"],
   ]
   }
}.each do |category, subcategories|
  subcategories.each do |subcategory, foods|
    foods.each do |text, price|
      food = Food.parse "#{category}XXX#{subcategory}XXX#{text}XXX#{price}"
      food.subcategory = "" if food.subcategory == "_"
      food.save!
    end
  end
end

