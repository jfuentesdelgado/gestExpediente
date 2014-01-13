class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]

  # GET /registros
  # GET /registros.json
  def index
    @registros = Registro.all
  end

  # GET /registros/1
  # GET /registros/1.json
  def show
  end

  # GET /registros/new
  def new
    @registro = Registro.new
  end

  # GET /registros/1/edit
  def edit
  end

  # POST /registros
  # POST /registros.json
  def create
    @registro = Registro.new(registro_params)

    respond_to do |format|
      if @registro.save
        format.html { redirect_to @registro, notice: 'Registro was successfully created.' }
        format.json { render action: 'show', status: :created, location: @registro }
      else
        format.html { render action: 'new' }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registros/1
  # PATCH/PUT /registros/1.json
  def update
    respond_to do |format|
      if @registro.update(registro_params)
        format.html { redirect_to @registro, notice: 'Registro was successfully updated.' }
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
      params.require(:registro).permit(:numero, :, :tipo, :fecha, :hora, :bultos, :matriculaCamion, :matriculaRemolque, :pesoneto, :pesobruto, :procedencia, :conocimiento, :precinto1, :, :precinto2, :, :precinto3, :, :flete, :total, :estado)
    end
end
