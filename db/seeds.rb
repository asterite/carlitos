# coding: utf-8

Food.delete_all

{"HAMBURGUESAS" =>
   {"_" => [
           ["1- Sola", "10.00"],
           ["2- Con queso o tomate", "12.00"],
           ["3- Con queso y tomate o jamón", "14.00"],
           ["3- Bis Con queso, huevo y panceta", "17.00"],
           ["4- Con queso, cebolla, tomate y lechuga", "16.00"],
           ["5- Con jamón, queso, tomate y lechuga", "17.00"],
           ["6- Con jamón, queso, tomate, huevo y lechuga", "18.00"],
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

