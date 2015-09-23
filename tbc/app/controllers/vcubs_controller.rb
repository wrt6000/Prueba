class VcubsController < ApplicationController
  before_action :set_vcub, only: [:show, :edit, :update, :destroy, :cambiar_estado, :cambiar_posicion,:cambiar_prestada]

  # GET /vcubs
  # GET /vcubs.json
  def index
    @vcubs = Vcub.all
    render :json => @vcubs
  end

  # GET /vcubs/1
  # GET /vcubs/1.json
  def show
    render :json => @vcub
  end

  # GET /vcubs/new
  def new
    @vcub = Vcub.new
  end

  # GET /vcubs/1/edit
  def edit
  end

  # POST /vcubs
  # POST /vcubs.json
  def create
    @vcub = Vcub.new(vcub_params)

    respond_to do |format|
      if @vcub.save
        format.html { redirect_to @vcub, notice: 'Vcub was successfully created.' }
        format.json { render :show, status: :created, location: @vcub }
      else
        format.html { render :new }
        format.json { render json: @vcub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vcubs/1
  # PATCH/PUT /vcubs/1.json
  def update
    respond_to do |format|
      if @vcub.update(vcub_params)
        format.html { redirect_to @vcub, notice: 'Vcub was successfully updated.' }
        format.json { render :show, status: :ok, location: @vcub }
      else
        format.html { render :edit }
        format.json { render json: @vcub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vcubs/1
  # DELETE /vcubs/1.json
  def destroy
    @vcub.destroy
    respond_to do |format|
      format.html { redirect_to vcubs_url, notice: 'Vcub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Modifica la posicion del vcub.
  #PUT tranvia/:id/posicio n
  def cambiar_posicion
    @vcub.update_attribute(:posicion,params[:posicion])
  end

  #Modifica el estado del tranvia.
  #PUT tranvia/:id/estado
  def cambiar_estado
    @vcub.update_attribute(:estado,params[:estado])
  end
  #Modifica si el vcub está prestado
  #PUT vcub/:id/prestada
  def cambiar_prestada
    @vcub.update_attribute(:prestada,params[:prestada])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vcub
      @vcub = Vcub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vcub_params
      params.require(:vcub).permit(:posicion, :estado, :prestada)
    end
end
