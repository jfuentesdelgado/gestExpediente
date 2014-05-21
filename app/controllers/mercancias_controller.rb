class MercanciasController < ApplicationController
  before_action :set_mercancia, only: [:show, :edit, :update, :destroy]

  # GET /mercancias
  # GET /mercancias.json
  def index
    @mercancias = Mercancia.all
  end

  # GET /mercancias/1
  # GET /mercancias/1.json
  def show
  end

  # GET /mercancias/new
  def new
    @mercancia = Mercancia.new
  end

  # GET /mercancias/1/edit
  def edit
  end

  # POST /mercancias
  # POST /mercancias.json
  def create
    @mercancia = Mercancia.new(mercancia_params)

    respond_to do |format|
      if @mercancia.save
        format.html { redirect_to @mercancia, notice: 'Mercancia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mercancia }
      else
        format.html { render action: 'new' }
        format.json { render json: @mercancia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mercancias/1
  # PATCH/PUT /mercancias/1.json
  def update
    respond_to do |format|
      if @mercancia.update(mercancia_params)
        format.html { redirect_to @mercancia, notice: 'Mercancia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mercancia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mercancias/1
  # DELETE /mercancias/1.json
  def destroy
    if @mercancia.destroy
      alerta="Mercancia eliminado con exito"  
    else
      alerta="No se ha podido eliminar el mercancia"
    end

    respond_to do |format|
      format.html { redirect_to mercancias_url, notice: alerta }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mercancia
      @mercancia = Mercancia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mercancia_params
      params.require(:mercancia).permit(:nombre)
    end
end
