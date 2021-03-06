class ExpedientesController < ApplicationController
  before_action :set_expediente, only: [:show, :edit, :update, :destroy]

  # GET /expedientes
  # GET /expedientes.json
  def index
    @expedientes = Expediente.all
  end

  # GET /expedientes/1
  # GET /expedientes/1.json
  def show
  end

  # GET /expedientes/new
  def new
    @expediente = Expediente.new
  end

  # GET /expedientes/1/edit
  def edit
  end

  # POST /expedientes
  # POST /expedientes.json
  def create
    @expediente = Expediente.new(expediente_params)

    respond_to do |format|
      if @expediente.save
        format.html { redirect_to @expediente, notice: 'Expediente was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expediente }
      else
        format.html { render action: 'new' }
        format.json { render json: @expediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expedientes/1
  # PATCH/PUT /expedientes/1.json
  def update
    respond_to do |format|
      if @expediente.update(expediente_params)
        format.html { redirect_to @expediente, notice: 'Expediente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expediente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expedientes/1
  # DELETE /expedientes/1.json
  def destroy
    @expediente.destroy
    respond_to do |format|
      format.html { redirect_to expedientes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expediente
      @expediente = Expediente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expediente_params
      params.require(:expediente).permit(:numero, :registro_id)
    end
end
