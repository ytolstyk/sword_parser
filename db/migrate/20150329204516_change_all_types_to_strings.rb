class ChangeAllTypesToStrings < ActiveRecord::Migration
  def change
    change_column :swords, :in_stock, :string
  end
end