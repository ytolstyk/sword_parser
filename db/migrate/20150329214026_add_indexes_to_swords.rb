class AddIndexesToSwords < ActiveRecord::Migration
  def change
    add_index :swords, :total_length
    add_index :swords, :blade_length
    add_index :swords, :price
    add_index :swords, :edge
    add_index :swords, :weight
    add_index :swords, :in_stock
  end
end