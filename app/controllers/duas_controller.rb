class DuasController < ApplicationController
  before_action :set_dua, only: [:show, :edit, :update, :destroy]

  # GET /duas
  # GET /duas.json
  def index
    @duas = Dua.all
  end

  # GET /duas/1
  # GET /duas/1.json
  def show
  end

  # GET /duas/new
  def new
    @dua = Dua.new
  end

  # GET /duas/1/edit
  def edit
    
  end

  # POST /duas
  # POST /duas.json
  def create
    @dua = Dua.new(dua_params)

    respond_to do |format|
      if @dua.save
        format.html { redirect_to @dua, notice: 'Dua was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dua }
      else
        format.html { render action: 'new' }
        format.json { render json: @dua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duas/1
  # PATCH/PUT /duas/1.json
  def update
    respond_to do |format|
      if @dua.update(dua_params)
        format.html { redirect_to @dua, notice: 'Dua was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duas/1
  # DELETE /duas/1.json
  def destroy
    @dua.destroy
    respond_to do |format|
      format.html { redirect_to duas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dua
      @dua = Dua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dua_params
      #params.require(:dua).permit(:dua, :belongs_to)
      params.require(:dua).permit(:dua, :registro_id)
    end
end
