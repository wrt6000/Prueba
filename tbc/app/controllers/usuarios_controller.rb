class UsuariosController < ApplicationController
  before_action :set_usuario,  only: [:show, :edit, :update, :destroy,:reservar]
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
    render :json => @usuarios
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  def access
  end

  def administrador
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    @vacio = "jiop"
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /usuarios/1/reservar
  # POST /usuarios/.json
  def reservar
    @id = @usuario.id
    laRuta= params["ruta"]
    direccionL= params["direccionLlegada"]
    direccionO= params["direccionOrigen"]
    tiempo = Time.now
    horaS = tiempo.hour
    horaL = horaS+6
    redirect_to(reserva_cree_path( estado: "nuevo",fecha: tiempo, direccion_llegada: direccionO, direccion_salida: direccionL, horaSalida: horaS, horaLlegada: horaL, ruta: laRuta, distancia: 0, idUsuario: @id, nombreUsuario: @usuario.nombre))
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :documento, :correo, :contrasenia)
    end

end
