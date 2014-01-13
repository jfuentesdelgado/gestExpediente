class TransitariosController < ApplicationController
  before_action :set_transitario, only: [:show, :edit, :update, :destroy]

  # GET /transitarios
  # GET /transitarios.json
  def index
    @transitarios = Transitario.all
  end

  # GET /transitarios/1
  # GET /transitarios/1.json
  def show
  end

  # GET /transitarios/new
  def new
    @transitario = Transitario.new
  end

  # GET /transitarios/1/edit
  def edit
  end

  # POST /transitarios
  # POST /transitarios.json
  def create
    @transitario = Transitario.new(transitario_params)

    respond_to do |format|
      if @transitario.save
        format.html { redirect_to @transitario, notice: 'Transitario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transitario }
      else
        format.html { render action: 'new' }
        format.json { render json: @transitario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transitarios/1
  # PATCH/PUT /transitarios/1.json
  def update
    respond_to do |format|
      if @transitario.update(transitario_params)
        format.html { redirect_to @transitario, notice: 'Transitario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transitario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transitarios/1
  # DELETE /transitarios/1.json
  def destroy
    @transitario.destroy
    respond_to do |format|
      format.html { redirect_to transitarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transitario
      @transitario = Transitario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transitario_params
      params.require(:transitario).permit(:nombre)
    end
end
