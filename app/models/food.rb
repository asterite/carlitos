class Food < ActiveRecord::Base
  NOT_IN_JSON = ['category', 'subcategory', 'created_at', 'updated_at']

  def self.parse(text)
    text =~ /^(.+?)XXX(.+?)XXX(.+?)-(.+?)(?:\((.+?)\))?XXX(.+?)$/
    Food.new(
      :category => $1.strip,
      :subcategory => $2.strip,
      :number => $3.strip,
      :description => $4.strip,
      :dedicated_to => $5.try(:strip) || '',
      :price => $6.to_f
    )
  end

  def as_json(options = {})
    json = super.reject{|k, v| NOT_IN_JSON.include?(k)}
    json['price'] = '%.2f' % json['price'].to_f
    json
  end
end
