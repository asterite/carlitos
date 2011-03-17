class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :number
      t.string :category
      t.string :subcategory
      t.decimal :price
      t.string :description
      t.string :dedicated_to

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
