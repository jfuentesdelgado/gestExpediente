class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]


  def imprimir
    @filterrific = Filterrific.new(Registro, params[:filterrific] || session[:filterrific_registros])
      # @registros = Registro.filterrific_find(@filterrific).page(params[:page])
      @registros = Registro.filterrific_find(@filterrific).order('numero desc')
     

    render layout: "impresion"
  end

  # GET /registros
  # GET /registros.json
  def index

    # if session[:year]==nil  
    #   fecha=Time.new  
    #   session[:year]= fecha.year
    # end
    # @year = session[:year]

    @clientes= Cliente.all
    @mercancias = Mercancia.all
    @transitarios = Transitario.all
    @barcos = Barco.all
    

     @filterrific = Filterrific.new(Registro, params[:filterrific] || session[:filterrific_registros])
    
     
     @registros = Registro.filterrific_find(@filterrific).order('numero desc').page(params[:page]).per(5)
     @numero_registros = Registro.filterrific_find(@filterrific).order('numero desc').count

     # @registros = Registro.filterrific_find(@filterrific).order('numero desc')
     # @numero_registros = @registros.count
     # @registros= @registros.page(params[:page]).per(5)
     

     session[:filterrific_registros] = @filterrific.to_hash

# Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

    

    # @registros = Registro.where(year: @year).order('numero desc').page(params[:page]).per(5)

  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_registros] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to :action => :index
  end

  # GET /registros/1
  # GET /registros/1.json
  def show
  end

  # GET /registros/new
  def new
    @registro = Registro.new
   if session[:year]==nil  
      fecha=Time.new  
      session[:year]= fecha.year
    end
    @registro.year = session[:year]
    @registro.valoresDefecto
    
    #@duas=@registro.duas

    @clientes = Cliente.all
    @mercancias = Mercancia.all
    @transitarios = Transitario.all
    @barcos = Barco.all
  end

  # GET /registros/1/edit
  def edit
    @clientes = Cliente.all
    @mercancias = Mercancia.all
    @transitarios = Transitario.all
    @barcos = Barco.all
    #@duas=@registro.duas

  end

  # POST /registros
  # POST /registros.json
  def create
    @registro = Registro.new(registro_params)

    duas=params[:dua]
    # debugger

    @registro.addDuas(duas) if duas

    expedientes=params[:numero]
    # debugger

    @registro.addExpedientes(expedientes) if expedientes

    respond_to do |format|
      if @registro.save
        format.html { redirect_to @registro, notice: 'Registro creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @registro }
      else
        @clientes = Cliente.all
        @mercancias = Mercancia.all
        @transitarios = Transitario.all
        @barcos = Barco.all
        format.html { render action: 'new' }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateEstado
    registro=Registro.find(params[:registroid])
    registro.updateEstado(params[:estado])
    registro.save
    redirect_to registro
  end

  # PATCH/PUT /registros/1
  # PATCH/PUT /registros/1.json
  def update

    duas=params[:dua]
    @registro.updateDuas(duas)

    expedientes=params[:numero]
    @registro.updateExpedientes(expedientes)

    respond_to do |format|
      if @registro.update(registro_params)
        format.html { redirect_to @registro, notice: 'Registro actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registros/1
  # DELETE /registros/1.json
  def destroy
    @registro.destroy
    respond_to do |format|
      format.html { redirect_to registros_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @registro = Registro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_params

      params.require(:registro).permit(:year, :cliente_id, :mercancia_id, :transitario_id, :barco_id, :numero, :tipo, :fecha, :hora, :bultos, :matriculaCamion, :matriculaRemolque, :pesoneto, :pesobruto, :procedencia, :conocimiento, :precinto1, :precinto2,  :precinto3,  :flete, :total, :estado)

    end
end