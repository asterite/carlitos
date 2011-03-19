class Food < ActiveRecord::Base
  NOT_IN_JSON = ['id', 'category', 'subcategory', 'created_at', 'updated_at']
  Number = 0
  Description = 1
  DedicatedTo = 2
  Price = 3
  Full = 4

  def self.parse(text, options = {})
    text =~ /^(?:(.+?)-)?(.+?)(?:\((.+?)\))?$/
    Food.new(options.merge(:number => $1.try(:strip) || '', :description => $2.strip, :dedicated_to => $5.try(:strip) || ''))
  end

  def as_json(options = {})
    [number, description, dedicated_to, '%.2f' % price]
  end
end
