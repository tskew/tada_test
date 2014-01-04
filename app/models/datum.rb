class Datum < ActiveRecord::Base
	belongs_to :supplier
	validates :supplier_id, presence: true
	validates :phone, presence: true, uniqueness: true

	def self.import(file, supplier_id)
		error_count = 0
		record_count = 0
		CSV.foreach(file.path, headers: true) do |row|
			record = Datum.where(
				:name => row[0],
				:phone => row[1],
				:supplier_id => supplier_id).create
			record_count += 1
			if record.invalid?
				error_count += 1
			end
		end
		output = Report.new(supplier_id: supplier_id, error_number: error_count, total_records: record_count)
		output.save!
	end
end