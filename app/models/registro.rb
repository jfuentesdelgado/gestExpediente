class Registro < ActiveRecord::Base
	
	has_many :duas

	has_many :expedientes

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
	
	
	validates :bultos, :pesobruto, :pesoneto, :total, numericality: {only_integer: true}
	validates :tipo, inclusion: { in: %w(I T E C), message: "%{value} no es un tipo valido. Tipos validos I T E C"}
	validates :estado, inclusion: { in: %w(registro facturacion contabilidad archivado consulta), message: "%{value} no es un estado valido. Estados validos registro facturacion contabilidad archivado consulta"}

	def mostrarNumero
		 self.numero.to_s + "/" + self.year.to_s[2..4]
	end

	def addDuas duas
		duas.each do |d|
			if (self.duas.where(dua: d).empty?)
				dua= Dua.new
				dua.dua = d
				self.duas << dua
			end
		end
	end

	def addExpedientes expedientes
		expedientes.each do |d|
			if (self.expedientes.where(expediente: d).empty?)
				expediente= Expediente.new
				expediente.numero = d
				self.expedientes << expediente
			end
		end
	end

	def updateEstado estado
		debugger
		self.estado=estado		
	end

	def updateDuas duas
		 # debugger
		duasbd=self.duas

		if duas==nil 
			duasbd.destroy_all
		else
			duasbd.each do |d|
				 #comprueba se existe el elemento d en el array duas
				 if duas.include?(d.dua)
				 	#si existe, eliminarlo del array
				 	duas.delete(d.dua)
				 else
				 	#si no, eliminarlo de d
				 	d.destroy
				 end
			end	 
			#añadir los elementos que quedan de duas a d 
			if not(duas==nil)
				duas.each do |f|
						dua= Dua.new
						dua.dua = f
						self.duas << dua
				end
			end
		end
	end


	def updateExpedientes expedientes
		 
		expedientebd=self.expedientes

		if expedientes==nil
			expedientebd.destroy_all
		else
			expedientebd.each do |d|
				 #comprueba se existe el elemento d en el array duas
				 if expedientes.include?(d.numero)
				 	#si existe, eliminarlo del array
				 	expedientes.delete(d.numero)
				 else
				 	#si no, eliminarlo de d
				 	d.destroy
				 end
			end
			#añadir los elementos que quedan de duas a d 
			if not(expedientes==nil)
				expedientes.each do |f|
						expediente= Expediente.new
						expediente.numero = f
						self.expedientes << expediente
				end
			end
		end

	end



	def valoresDefecto()
		
	    registros=Registro.where( year: self.year)
	    self.numero = registros.empty? ? 1 : registros.maximum("numero")+1
		
	    self.bultos= 0
	    self.matriculaCamion=0
	    self.matriculaRemolque=0
	    self.pesoneto=0
	    self.pesobruto=0
	    self.procedencia=" "
	    self.conocimiento=0
	    self.precinto1=0
	    self.precinto2=0
	    self.precinto3=0
	    self.flete=0
	    self.total=0
	end

	

end
