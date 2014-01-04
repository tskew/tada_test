class ChangeErrorsColumnName < ActiveRecord::Migration
  def change
  	rename_column :reports, :errors, :error_number
  end
end
