class AddItem < ActiveRecord::Migration
  def change
    add_column :swords, :item, :string, null: true
    add_column :swords, :page_url, :string, null: true
  end
end
