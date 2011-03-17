class Food < ActiveRecord::Base
  NOT_IN_JSON = ['id', 'created_at', 'updated_at']

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

  def as_json(options = {})
    super.reject{|k, v| NOT_IN_JSON.include?(k)}
  end
end
