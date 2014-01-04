class AddIndexToDataPhone < ActiveRecord::Migration
  def change
  	add_index :data, :phone, unique: true
  end
end
