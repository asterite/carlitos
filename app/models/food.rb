class Food < ActiveRecord::Base
  NOT_IN_JSON = ['category', 'subcategory', 'created_at', 'updated_at']

  def self.parse(text, options = {})
    text =~ /^(?:(.+?)-)?(.+?)(?:\((.+?)\))?$/
    Food.new(options.merge(:number => $1.try(:strip) || '', :description => $2.strip, :dedicated_to => $5.try(:strip) || ''))
  end

  def as_json(options = {})
    json = super.reject{|k, v| NOT_IN_JSON.include?(k)}
    json['price'] = '%.2f' % json['price'].to_f
    json
  end
end
