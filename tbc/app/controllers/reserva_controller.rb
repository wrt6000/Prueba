class ReservaController < ApplicationController

  before_action :set_reserva, only: [:show, :edit, :update, :destroy]

  def index
    @reserva = Reserva.all
    render :json => @reserva
  end

  # POST /conductors
  # POST /conductors.json
  def create
    fecha = Time.now
    @reserva = Reserva.new(estado: params[:estado],fecha:fecha, direccion_salida: params[:direccion_salida], direccion_llegada: params[:direccion_llegada], hora_de_salida:  params[:horaSalida], hora_de_llegada: params[:horaLlegada], ruta: params[:ruta], distancia: params[:distancia], usuario_id: params[:idUsuario], nombreUsuario: params[:nombreUsuario] )

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: 'Reserva was successfully created.' }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end


  end

  def show
  end

  def destroy
  end

  private

  def set_reserva
    @reserva = Reserva.find(params[:id])
  end
end
