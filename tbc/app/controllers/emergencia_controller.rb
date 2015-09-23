class EmergenciaController < ApplicationController
  before_action :set_emergencia, only: [:show]

  def index
    @emergencias = Emergencia.all
    render :json => @emergencias
  end

  def create
    @emergencia = Emergencia.new
    fecha = Time.now
    @emergencia.update_attributes(id_vehiculo: params[:id_vehiculo], tipo_vehiculo: params[:tipo_vehiculo], magnitud: params[:magnitud], posicion:  params[:posicion], fecha: fecha )
    @emergencia.save
    redirect_to emergencia_path

  end

  def show
  end

  def destroy
  end

  private

    def set_emergencia
      @emergencia = Emergencia.find(params[:id])
    end
end
