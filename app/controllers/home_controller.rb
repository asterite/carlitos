class HomeController < ApplicationController
  def index
    @foods = Food.all
    @foods.sort! { |x, y| x.number <=> y.number }
    @foods_json = @foods.group_by &:category
    @foods_json.each do |category, foods|
      @foods_json[category] = foods.group_by(&:subcategory).as_json
    end
  end
end
