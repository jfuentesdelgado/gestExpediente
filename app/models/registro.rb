class Registro < ActiveRecord::Base
	
	has_many :duas

	has_many :histories

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
	validates :estado, inclusion: { in: ['registro','facturacion','contabilidad','archivado','consulta admin','consulta aduana'], message: "%{value} no es un estado valido. Estados validos  'registro','facturacion','contabilidad','archivado','consulta admin','consulta aduana'"}

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
		
		# debugger

		historico=History.new
		historico.date= Time.new
		historico.original_state=self.estado
		historico.final_state=estado
		
		self.histories << historico
		historico.save

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

	filterrific(

		:filter_names => [
    		:search_procedencia
    	]
  # :default_settings => { :sorted_by => 'created_at_desc' },
  # :filter_names => [
  #   :search_query,
  #   :sorted_by,
  #   :with_country_id,
  #   :with_created_at_gte
  # ]
)
# define ActiveRecord scopes for
# :search_query, :sorted_by, :with_country_id, and :with_created_at_gte


scope :search_procedencia, lambda { |proc|
  where(:procedencia => [*proc])
}

# scope :search_procedencia, lambda { |query|
#   # Searches the students table on the 'first_name' and 'last_name' columns.
#   # Matches using LIKE, automatically appends '%' to each term.
#   # LIKE is case INsensitive with MySQL, however it is case
#   # sensitive with PostGreSQL. To make it work in both worlds,
#   # we downcase everything.
#   return nil  if query.blank?

#   # condition query, parse into individual keywords
#   terms = query.downcase.split(/\s+/)

#   # replace "*" with "%" for wildcard searches,
#   # append '%', remove duplicate '%'s
#   terms = terms.map { |e|
#     (e.gsub('*', '%') + '%').gsub(/%+/, '%')
#   }
#   # configure number of OR conditions for provision
#   # of interpolation arguments. Adjust this if you
#   # change the number of OR conditions.
#   num_or_conds = 2
#   where(
#     terms.map { |term|
#       "(LOWER(registros.procedencia) LIKE ? OR LOWER(registros.procedencia) LIKE ?)"
#     }.join(' AND '),
#     *terms.map { |e| [e] * num_or_conds }.flatten
#   )
# }

end
