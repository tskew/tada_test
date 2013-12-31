class Datum < ActiveRecord::Base
	belongs_to :supplier
	validates :supplier_id, presence: true
	validates :phone, presence: true, uniqueness: true

	def self.import(file, supplier_id)
		CSV.foreach(file.path, headers: true) do |row|
			record = Datum.where(
				:name => row[0],
				:phone => row[1],
				:supplier_id => supplier_id).create!
		end
	end
end
