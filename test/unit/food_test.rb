# coding: utf-8

require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  test "parse" do
    food = Food.parse "Panqueue, Con Jamon Cocido, 77- Jamón cocido y queso (PARA EL ESCRITOR JULIO CORTAZAR), 17,00"
    assert_equal "Panqueue", food.category
    assert_equal "Con Jamon Cocido", food.subcategory
    assert_equal "77", food.number
    assert_equal "Jamón cocido y queso", food.description
    assert_equal "PARA EL ESCRITOR JULIO CORTAZAR", food.dedicated_to
    assert_equal 17.0, food.price.to_f
  end
end
