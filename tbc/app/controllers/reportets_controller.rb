class ReportetsController < ApplicationController
  before_action :set_reportet, only: [:show]

  def index
    @reportets = Reportet.all
    render :json => @reportets
  end

  def new
    @reportet = Reportet.new
  end

  def create
    @reportet = Reportet.new
    @reportet.update_attributes(tranvium_id: params[:idTranvia], fecha: params[:fecha], tiempopromedio: params[:tiempoPromedio], trayectos: params[:trayectos])
    @reportet.save
    redirect_to reportet_path
  end

  def show
  end

  def destroy
  end

  private

  def set_reportet
    @reportet = Reportet.find(params[:id])
  end
end
