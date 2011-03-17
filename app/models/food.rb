class Food < ActiveRecord::Base
  def self.parse(text)
    text =~ /^(.+?),(.+?),(.+?)-(.+?)(?:\((.+?)\))?,(.+?)$/
    Food.new(
      :category => $1.strip,
      :subcategory => $2.strip,
      :number => $3.strip,
      :description => $4.strip,
      :dedicated_to => $5.strip,
      :price => $6.to_f
    )
  end
end
