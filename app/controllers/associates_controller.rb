class AssociatesController < ApplicationController
  before_action :set_associate, only: [:show, :edit, :update, :destroy]

  # GET /associates
  # GET /associates.json
  def index
    @associates = Associate.all
  end

  # GET /associates/1
  # GET /associates/1.json
  def show
  end

  # GET /associates/new
  def new
    @associate = Associate.new
  end

  # GET /associates/1/edit
  def edit
  end

  # POST /associates
  # POST /associates.json
  def create
    @associate = Associate.new(associate_params)

    respond_to do |format|
      if @associate.save
        format.html { redirect_to @associate, notice: 'Associate was successfully created.' }
        format.json { render :show, status: :created, location: @associate }
      else
        format.html { render :new }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associates/1
  # PATCH/PUT /associates/1.json
  def update
    respond_to do |format|
      if @associate.update(associate_params)
        format.html { redirect_to @associate, notice: 'Associate was successfully updated.' }
        format.json { render :show, status: :ok, location: @associate }
      else
        format.html { render :edit }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associates/1
  # DELETE /associates/1.json
  def destroy
    @associate.destroy
    respond_to do |format|
      format.html { redirect_to associates_url, notice: 'Associate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associate
      @associate = Associate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def associate_params
      params.require(:associate).permit(:company_name, :title, :first_name, :last_name, :mobile_number, :landline_number, :bussiness_category, :address_building, :address_street, :address_landmark, :address_area, :address_city, :address_pincode, :contact_person, :contact_person_designation, :fax_number, :fax_number_two, :toll_free_number, :toll_free_number_two, :email_id, :website, :display_hours_status, :year_of_establishment, :annual_turnover, :number_of_employees, :professional_association, :certifications, :payment_mode_id, :monday_from, :monday_to, :monday_status, :tuesday_from, :tuesday_to, :tuesday_status, :wednesday_from, :wednesday_to, :wednesday_status, :thursday_from, :thursday_to, :thursday_status, :friday_from, :friday_to, :friday_status, :saturday_from, :saturday_to, :saturday_status, :sunday_from, :sunday_to, :sunday_status, :center_id)
    end
end
