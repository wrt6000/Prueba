class ConductortranviaController < ApplicationController
  before_action :set_conductortranvia, only: [:show, :edit, :update, :destroy]

  # GET /conductortranvia
  # GET /conductortranvia.json
  def index
    @conductortranvia = Conductortranvia.all
  end

  # GET /conductortranvia/1
  # GET /conductortranvia/1.json
  def show
  end

  # GET /conductortranvia/new
  def new
    @conductortranvia = Conductortranvia.new
  end

  # GET /conductortranvia/1/edit
  def edit
  end

  # POST /conductortranvia
  # POST /conductortranvia.json
  def create
    @conductortranvia = Conductortranvia.new(conductortranvia_params)

    respond_to do |format|
      if @conductortranvia.save
        format.html { redirect_to @conductortranvia, notice: 'Conductor was successfully created.' }
        format.json { render :show, status: :created, location: @conductortranvia }
      else
        format.html { render :new }
        format.json { render json: @conductortranvia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conductortranvia/1
  # PATCH/PUT /conductortranvia/1.json
  def update

  end

  # DELETE /conductormobibuses/1
  # DELETE /conductormobibuses/1.json
  def destroy

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conductortranvia
    @conductortranvia = Conductortranvia.find(params[:id])
  end

end
