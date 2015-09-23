class TranviaController < ApplicationController
  before_action :set_tranvium, only: [:show, :edit, :update, :destroy, :cambiar_posicion, :cambiar_estado, :emergencia, :reporte]




  # GET /tranvia
  # GET /tranvia.json
  def index
    @tranvia = Tranvium.all
    render :json => @tranvia
  end

  # GET /tranvia/1
  # GET /tranvia/1.json
  def show
  end

  # GET /tranvia/new
  def new
    @tranvium = Tranvium.new
  end

  # GET /tranvia/1/edit
  def edit
  end

  # POST /tranvia
  # POST /tranvia.json
  def create
    @tranvium = Tranvium.new(tranvium_params)

    respond_to do |format|
      if @tranvium.save
        format.html { redirect_to @tranvium, notice: 'Tranvium was successfully created.' }
        format.json { render :show, status: :created, location: @tranvium }
      else
        format.html { render :new }
        format.json { render json: @tranvium.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /tranvia/1
  # PATCH/PUT /tranvia/1.json
  def update
    respond_to do |format|
      if @tranvium.update(tranvium_params)
        format.html { redirect_to @tranvium, notice: 'Tranvium was successfully updated.' }
        format.json { render :show, status: :ok, location: @tranvium }
      else
        format.html { render :edit }
        format.json { render json: @tranvium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tranvia/1
  # DELETE /tranvia/1.json
  def destroy
    @tranvium.destroy
    respond_to do |format|
      format.html { redirect_to tranvia_url, notice: 'Tranvium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Modifica la posicion del tranvia.
  #PUT tranvia/:id/posicion
  def cambiar_posicion
    @tranvium.update_attribute(:posicion,params[:posicion])
  end

  #Modifica el estado del tranvia.
  #PUT tranvia/:id/estado
  def cambiar_estado
    @tranvium.update_attribute(:estado,params[:estado])
  end

  #Reporta una nueva emergencia
  #POST tranvia/:id/emergencia
  def emergencia
    @tranvium.update_attributes(boton_panico: true, estado: 'Emergencia')
    redirect_to (emergencia_create_path(id_vehiculo: @tranvium.id, tipo_vehiculo: 'Tranvia', magnitud: 4, posicion: @tranvium.posicion ))
  end

  #POST tranvia/:id/reportar
  def reporte
    tiempoPromedio = params["tiempoPromedio"]
    trayectos = params["trayectos"]
    fecha = Time.now
    redirect_to(reportets_crear_path(idTranvia: @tranvium.id, fecha: fecha , trayectos: trayectos, tiempoPromedio: tiempoPromedio))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tranvium
      @tranvium = Tranvium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tranvium_params
      params.require(:tranvium).permit(:identificacion, :linea, :kilms_ultima_revision, :temperatura, :posicion, :estado, :boton_panico)
    end
end
