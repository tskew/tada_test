class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :supplier_id
      t.integer :errors

      t.timestamps
    end
  end
end
