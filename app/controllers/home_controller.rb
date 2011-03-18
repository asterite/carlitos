class HomeController < ApplicationController
  def index
    @foods = Food.all
    @foods.sort! do |x, y|
      ret = x.number.to_i <=> y.number.to_i
      ret = x.number <=> y.number if ret == 0
      ret
    end
    @foods_json = @foods.group_by &:category
    @foods_json.each do |category, foods|
      @foods_json[category] = foods.group_by(&:subcategory).as_json
    end
  end
end
