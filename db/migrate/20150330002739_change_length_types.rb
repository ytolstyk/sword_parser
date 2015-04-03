class ChangeLengthTypes < ActiveRecord::Migration
  def change
    change_column :swords, :total_length, :integer
    change_column :swords, :hilt_length, :integer
    change_column :swords, :blade_length, :integer
  end
end
