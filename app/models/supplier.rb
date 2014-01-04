class Supplier < ActiveRecord::Base
	has_many :data
	has_many :reports, dependent: :destroy
end
