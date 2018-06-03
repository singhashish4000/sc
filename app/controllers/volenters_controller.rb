class VolentersController < ApplicationController
  before_action :set_volenter, only: [:show, :edit, :update, :destroy]

  # GET /volenters
  # GET /volenters.json
  def index
    @volenters = Volenter.all
  end

  # GET /volenters/1
  # GET /volenters/1.json
  def show
  end

  # GET /volenters/new
  def new
    @volenter = Volenter.new
  end

  # GET /volenters/1/edit
  def edit
  end

  # POST /volenters
  # POST /volenters.json
  def create
    @volenter = Volenter.new(volenter_params)

    respond_to do |format|
      if @volenter.save
        format.html { redirect_to @volenter, notice: 'Volenter was successfully created.' }
        format.json { render :show, status: :created, location: @volenter }
      else
        format.html { render :new }
        format.json { render json: @volenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volenters/1
  # PATCH/PUT /volenters/1.json
  def update
    respond_to do |format|
      if @volenter.update(volenter_params)
        format.html { redirect_to @volenter, notice: 'Volenter was successfully updated.' }
        format.json { render :show, status: :ok, location: @volenter }
      else
        format.html { render :edit }
        format.json { render json: @volenter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volenters/1
  # DELETE /volenters/1.json
  def destroy
    @volenter.destroy
    respond_to do |format|
      format.html { redirect_to volenters_url, notice: 'Volenter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volenter
      @volenter = Volenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volenter_params
      params.require(:volenter).permit(:name, :age, :gender, :address, :phone_no, :adhaar_no, :center_id)
    end
end
