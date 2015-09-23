class ConductorsController < ApplicationController
  before_action :set_conductor, only: [:show, :edit, :update, :destroy, :asignarm, :asignart]

  # GET /conductors
  # GET /conductors.json
  def index
    @conductors = Conductor.all
    render :json => @conductors
  end

  # GET /conductors/1
  # GET /conductors/1.json
  def show
  end

  # GET /conductors/new
  def new
    @conductor = Conductor.new
  end

  # GET /conductors/1/edit
  def edit
  end

  # POST /conductors
  # POST /conductors.json
  def create
    @conductor = Conductor.new(conductor_params)

    respond_to do |format|
      if @conductor.save
        format.html { redirect_to @conductor, notice: 'Conductor was successfully created.' }
        format.json { render :show, status: :created, location: @conductor }
      else
        format.html { render :new }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conductors/1
  # PATCH/PUT /conductors/1.json
  def update
    respond_to do |format|
      if @conductor.update(conductor_params)
        format.html { redirect_to @conductor, notice: 'Conductor was successfully updated.' }
        format.json { render :show, status: :ok, location: @conductor }
      else
        format.html { render :edit }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conductors/1
  # DELETE /conductors/1.json
  def destroy
    @conductor.destroy
    respond_to do |format|
      format.html { redirect_to conductors_url, notice: 'Conductor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /conductors/1
  # POST /conductors/1.json
  def asignarm
    idmobi = params[:idMobibus]
    id =  @conductor.id
    @conductormobibus = Conductormobibus.new
    @conductormobibus.update_attributes(mobibus_id: idmobi, conductor_id: id)
    @conductormobibus.save
    @conductormobibuses = Conductormobibus.all
  end

  def asignart
    idtranvi = params[:idTranvia]
    id =  @conductor.id
    @conductortranvia = Conductortranvia.new
    @conductortranvia.update_attributes(tranvium_id: idtranvi, conductor_id: id)
    @conductortranvia.save
    @conductortranvia = Conductortranvia.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conductor
      @conductor = Conductor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conductor_params
      params.require(:conductor).permit(:nombre, :cedula)
    end
end
