class ConductormobibusesController < ApplicationController
  before_action :set_conductormobibus, only: [:show, :edit, :update, :destroy]

  # GET /conductormobibuses
  # GET /conductormobibuses.json
  def index
    @conductormobibuses = Conductormobibus.all
  end

  # GET /conductormobibuses/1
  # GET /conductormobibuses/1.json
  def show
  end

  # GET /conductormobibuses/new
  def new
    @conductormobibus = Conductormobibus.new
  end

  # GET /conductormobibuses/1/edit
  def edit
  end

  # POST /conductormobibuses
  # POST /conductormobibuses.json
  def create
    @conductormobibus = Conductormobibus.new(conductormobibus_params)

    respond_to do |format|
      if @conductormobibus.save
        format.html { redirect_to @conductormobibus, notice: 'Conductor was successfully created.' }
        format.json { render :show, status: :created, location: @conductormobibus }
      else
        format.html { render :new }
        format.json { render json: @conductormobibus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conductormobibuses/1
  # PATCH/PUT /conductormobibuses/1.json
  def update

  end

  # DELETE /conductormobibuses/1
  # DELETE /conductormobibuses/1.json
  def destroy

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conductormobibus
    @conductormobibus = Conductormobibus.find(params[:id])
  end

end
