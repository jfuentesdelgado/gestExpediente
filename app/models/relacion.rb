class Relacion < ActiveRecord::Base
	belongs_to :cliente
	belongs_to :mercancia
end
