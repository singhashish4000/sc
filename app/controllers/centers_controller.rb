class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]
  # before_action :set_names, only: [:index, :show]

  # GET /centers
  # GET /centers.json
  def index
    @centers = Center.all
  end



def populate_state_from_selected_country 
    state_arr = []
    if params['country_id'].present?
        country_id = params[:country_id]
        @states = State.where(country_id: country_id)
        @states.each do |state|
          state_arr.push(state) 
        end  
    end
    # p mm_details_arr
    flash.now[:danger] = 'No center here' 
    #render partial: 'welcome/middle_layer'
    render json: state_arr
end

def populate_district_from_selected_state 
  district_arr = []
  if params['state_id'].present?
      state_name = params[:state_id]
      state_id = State.where(name: state_name)
      @districts = District.where(state_id: state_id)
      @districts.each do |district|
        district_arr.push(district) 
      end  
  end
  # p mm_details_arr
  render json: district_arr
end

def populate_sub_district_from_selected_district 
  sub_district_arr = []
  if params['district_id'].present?
      district_name = params[:district_id]
      district_id = District.where(name: district_name)
      @sub_districts = SubDistrict.where(district_id: district_id)
      @sub_districts.each do |sub_district|
        sub_district_arr.push(sub_district) 
      end  
  end
  # p mm_details_arr
  render json: sub_district_arr
end

def populate_city_from_selected_sub_district 
  city_arr = []
  if params['city_id'].present?
      city_name = params[:city_id]
      city_id = SubDistrict.where(name: city_name)
      @cities = TownVillage.where(sub_district_id: city_id)
      @cities.each do |district|
        city_arr.push(district) 
      end  
  end
  # p mm_details_arr
  render json: city_arr
end

  # GET /centers/1
  # GET /centers/1.json
  def show
    @centers = Center.all
  end

  # GET /centers/new
  def new
    @center = Center.new
  end

  # GET /centers/1/edit
  def edit
  end

  # POST /centers
  # POST /centers.json
  def create
    @center = Center.new(center_params)

    respond_to do |format|
      if @center.save
        format.html { redirect_to @center, notice: 'Center was successfully created.' }
        format.json { render :show, status: :created, location: @center }
      else
        format.html { render :new }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1
  # PATCH/PUT /centers/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        format.html { redirect_to @center, notice: 'Center was successfully updated.' }
        format.json { render :show, status: :ok, location: @center }
      else
        format.html { render :edit }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1
  # DELETE /centers/1.json
  def destroy
    @center.destroy
    respond_to do |format|
      format.html { redirect_to centers_url, notice: 'Center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
    end

    def set_names
      @centers = Center.all
      @centers.each do |center|
      
        country_name = Country.find(center.country_id)
        @center_country = country_name.name
  
        state_name = State.find(center.state_id)
        @center_state = state_name.name
  
        district_name = District.find(center.district_id)
        @center_district = district_name.name
  
        sub_district_name = SubDistrict.find(center.sub_district_id)
        @center_sub_district = sub_district_name.name
  
        city_name = TownVillage.find(center.town_village_id)
        @center_city = city_name.name
      end 
    end   

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:center).permit(:name, :address, :no_of_volunters, :country_id, :state_id, :district_id, :sub_district_id, :town_village_id)
    end
end
