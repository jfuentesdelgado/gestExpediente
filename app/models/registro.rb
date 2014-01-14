class Registro < ActiveRecord::Base
	
	belongs_to :cliente
	belongs_to :mercancia
	belongs_to :transitario
	belongs_to :barco

	validates_associated :cliente
	validates_associated :mercancia
	validates_associated :transitario
	validates_associated :barco

	validates :numero , :tipo, :fecha, :hora, :bultos, :matriculaCamion, :matriculaRemolque, presence:true
	validates :pesoneto, :pesobruto, :procedencia, :conocimiento, :flete, :total, :estado, presence:true
	
	validates :numero, uniqueness: { case_sensitive:false }
	validates :bultos, :pesobruto, :pesoneto, :total, numericality: {only_integer: true}
	validates :tipo, inclusion: { in: %w(I T E C), message: "%{value} no es un tipo valido. Tipos validos I T E C"}
	validates :estado, inclusion: { in: %w(registro facturacion contabilidad archivado consulta), message: "%{value} no es un estado valido. Estados validos registro facturacion contabilidad archivado consulta"}


end
