class Registro < ActiveRecord::Base
	self.primary_key = :numero
	belongs_to :cliente
	belongs_to :mercancia
	belongs_to :transitario
	belongs_to :barco

end
