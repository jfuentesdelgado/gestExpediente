class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]

  # GET /registros
  # GET /registros.json
  def index
   
    
    if session[:year]==nil  
      fecha=Time.new  
      session[:year]= fecha.year
    end
      

    @year = session[:year]
    @registros = Registro.where(year: @year).order('numero desc').page(params[:page]).per(5)

  end

  # GET /registros/1
  # GET /registros/1.json
  def show
  end

  # GET /registros/new
  def new
    @registro = Registro.new
   
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
    debugger
 
    registro=Registro.find(params[:registroid])
    registro.estado= params[:estado]
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
