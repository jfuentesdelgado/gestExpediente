class Barco < ActiveRecord::Base
	has_many :registros
	validates :nombre, :presence => true

	before_destroy do |barco|
		if barco.resgistros.any?
			false
		end
	end

end
