class Barco < ActiveRecord::Base
	has_many :registros
	validates :nombre, :presence => true
end
