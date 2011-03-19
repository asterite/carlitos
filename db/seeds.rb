# coding: utf-8

Food.delete_all

{"HAMBURGUESAS" =>
   {"" => [
           ["1- Sola", "10.00"],
           ["2- Con queso o tomate", "12.00"],
           ["3- Con queso y tomate o jamón", "14.00"],
           ["3- Bis Con queso, huevo y panceta", "17.00"],
           ["4- Con queso, cebolla, tomate y lechuga", "16.00"],
           ["5- Con jamón, queso, tomate y lechuga", "17.00"],
           ["6- Con jamón, queso, tomate, huevo y lechuga", "18.00"],
           ["7- Completa sin huevo, con panceta o jamón", "19.00"],
           ["8- Completa con huevo, con panceta o jamón, queso, cebolla, tomate y lechuga (AL MONO ISAURRALDE)", "20.00"],
           ["9- Completa sin huevo, con roquefort", "20.00"],
           ["10- Completa con huevo, con roquefort (DEDICADO A LlLlANA LOPEZ FORESI)", "21.00"],
           ["11- Completa sin huevo, con choclo", "20.00"],
           ["12- Completa con huevo, con choclo (AL ACTOR HORACIO PEÑA)", "21.00"],
           ["13- Completa sin huevo, con palmitos", "21.00"],
           ["14- Completa con huevo, con palmitos (DEDICADO A ALBERTO OLMEDO)", "22.00"],
           ["15- Completa sin huevo, con berenjenas (A ESTEBAN MORGADO)", "21.00"],
           ["16- Completa con huevo, con berenjenas", "22.00"],
           ["17- Completa sin huevo, con ajíes o morrones (A PABLO PAZ)", "21.00"],
           ["18- Completa con huevo, con ajíes o morrones", "22.00"],
           ["19- Completa sin huevo, sin panceta, sin jamón", "16.00"],
           ["20- Completa con huevo, sin panceta, sin jamón (DEDICADO A GUSTAVO CERATI)", "17.00"],
           ["21- Cebolla, tomate, pepino, lechuga", "17.00"],
           ["22- Cebolla, tomate, ajo y orégano", "17.00"],
           ["23- Mayonesa de plata y tomate", "16.00"],
           ["24- Mayonesa de plata y roquefort", "16.00"],
           ["25- Sola con roquefort", "14.00"],
           ["26- Sola con choclo", "14.00"],
           ["27- Sola con palmitos", "16.00"],
           ["28- Sola con berenjenas", "14.00"],
           ["29- Sola con ajíes", "14.00"],
           ["30- Sola con pepinos", "14.00"],
           ["31- Sola con morrones", "15.00"],
           ["PAPAS FRITAS 1 PORCIÓN", "13.00"],
           ["PAPAS FRITAS 1/2 PORCIÓN", "10.00"],
           ["PAPAS FRITAS A LA PROVENZAL 1 PORCIÓN", "15.00"],
           ["PAPAS FRITAS A LA PROVENZAL 1/2 PORCIÓN", "12.00"],
           ["PAPAS FRITAS A CABALLO 1 PORCIÓN", "17.00"],
           ["PAPAS FRITAS A CABALLO 1/2 PORCIÓN", "14.00"],
           ["BATATAS FRITAS 1 PORCIÓN", "14.00"],
           ["BATATAS FRITAS 1/2 PORCIÓN", "11.00"],
           ["AROS DE CEBOLLA 1 PORCIÓN", "15.00"],
           ["AROS DE CEBOLLA 1/2 PORCIÓN", "12.00"],
     ]
   },
 "LOMITOS" => {
     "" => [
       ["32- Solo", "19.00"],
       ["33- Con queso o tomate", "21.00"],
       ["34- Con queso, tomate o jamón", "22.00"],
       ["35- Con queso, cebolla, tomate y lechuga", "23.00"],
       ["36- Con jamón, queso, tomate y lechuga", "24.00"],
       ["37- Con jamón, queso, tomate huevo y lechuga", "25.00"],
       ["38- Completo sin huevo, con panceta o jamón", "26.00"],
       ["39- Completo con huevo, con panceta o jamón", "28.00"],
       ["40- Completo sin huevo, con roquefort", "29.00"],
       ["41- Completo con huevo, con roquefort", "30.00"],
       ["42- Completo sin huevo, con choclo", "29.00"],
       ["43- Completo con huevo, con choclo", "30.00"],
       ["44- Completo sin huevo, con berenjenas", "29.00"],
       ["45- Completo con huevo, con berenjenas", "30.00"],
       ["46- Completo sin huevo, con palmitos", "32.00"],
       ["47- Completo con huevo, con palmitos", "34.00"],
       ["48- Completo sin huevo, con ajíes o morrones", "31.00"],
       ["49- Completo con huevo, con ajíes o morrones", "32.00"],
       ["50- Completo sin huevo, sin pacenta, sin jamón", "23.00"],
       ["51- Completo con huevo, sin pacenta, sin jamón", "25.00"],
       ["52- Cebolla, tomate, pepino, lechuga", "24.00"],
       ["53- Cebolla, tomate, ajo y orégano", "23.00"],
       ["54- Mayonesa de palta y tomate", "23.00"],
       ["55- Mayonesa de palta y roquefort", "23.00"],
       ["56- Solo con roquefort", "22.00"],
       ["57- Solo con choclo", "22.00"],
       ["58- Solo con palmitos", "24.00"],
       ["59- Solo con berenjenas", "23.00"],
       ["60- Solo con ajíes y morrones", "24.00"],
       ["61- Solo con pepinos", "24.00"],
     ]
   },
 "PANCHOS" => {
     "" => [
       ["62- Solo", "8.00"],
       ["63- Con queso", "10.00"],
       ["64- Jamón y queso", "12.00"],
       ["65- Panceta y cebolla", "11.00"],
       ["66- Panceta y queso", "12.00"],
       ["67- Panceta, queso y cebolla", "13.00"],
       ["68- Con chucrut", "11.00"],
       ["69- Panceta y chucrut", "12.00"],
       ["70- Chucrut y queso", "12.00"],
       ["71- Panceta, queso, cebolla y chucrut", "14.00"],
     ]
   }
}.each do |category, subcategories|
  subcategories.each do |subcategory, foods|
    foods.each do |text, price|
      food = Food.parse text, :category => category, :subcategory => subcategory, :price => price
      food.subcategory = "" if food.subcategory == "_"
      food.save!
    end
  end
end

