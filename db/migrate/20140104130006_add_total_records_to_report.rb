class AddTotalRecordsToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :total_records, :integer
  end
end
