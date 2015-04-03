class CreateSwords < ActiveRecord::Migration
  def change
    create_table :swords do |t|
      t.string :name
      t.string :total_length
      t.string :hilt_length
      t.string :blade_length
      t.float  :price
      t.string :edge
      t.float  :weight
      t.string :pob
      t.string :thickiness
      t.boolean :in_stock
      t.string :width
      t.string :img_url
      t.string :manufacturer
      t.string :type
      t.text   :description
      t.timestamps
    end
  end
end
