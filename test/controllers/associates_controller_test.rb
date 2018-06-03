require 'test_helper'

class AssociatesControllerTest < ActionController::TestCase
  setup do
    @associate = associates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:associates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create associate" do
    assert_difference('Associate.count') do
      post :create, associate: { address_area: @associate.address_area, address_building: @associate.address_building, address_city: @associate.address_city, address_landmark: @associate.address_landmark, address_pincode: @associate.address_pincode, address_street: @associate.address_street, annual_turnover: @associate.annual_turnover, bussiness_category: @associate.bussiness_category, center_id: @associate.center_id, certifications: @associate.certifications, company_name: @associate.company_name, contact_person: @associate.contact_person, contact_person_designation: @associate.contact_person_designation, display_hours_status: @associate.display_hours_status, email_id: @associate.email_id, fax_number: @associate.fax_number, fax_number_two: @associate.fax_number_two, first_name: @associate.first_name, friday_from: @associate.friday_from, friday_status: @associate.friday_status, friday_to: @associate.friday_to, landline_number: @associate.landline_number, last_name: @associate.last_name, mobile_number: @associate.mobile_number, monday_from: @associate.monday_from, monday_status: @associate.monday_status, monday_to: @associate.monday_to, number_of_employees: @associate.number_of_employees, payment_mode_id: @associate.payment_mode_id, professional_association: @associate.professional_association, saturday_from: @associate.saturday_from, saturday_status: @associate.saturday_status, saturday_to: @associate.saturday_to, sunday_from: @associate.sunday_from, sunday_status: @associate.sunday_status, sunday_to: @associate.sunday_to, thursday_from: @associate.thursday_from, thursday_status: @associate.thursday_status, thursday_to: @associate.thursday_to, title: @associate.title, toll_free_number: @associate.toll_free_number, toll_free_number_two: @associate.toll_free_number_two, tuesday_from: @associate.tuesday_from, tuesday_status: @associate.tuesday_status, tuesday_to: @associate.tuesday_to, website: @associate.website, wednesday_from: @associate.wednesday_from, wednesday_status: @associate.wednesday_status, wednesday_to: @associate.wednesday_to, year_of_establishment: @associate.year_of_establishment }
    end

    assert_redirected_to associate_path(assigns(:associate))
  end

  test "should show associate" do
    get :show, id: @associate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @associate
    assert_response :success
  end

  test "should update associate" do
    patch :update, id: @associate, associate: { address_area: @associate.address_area, address_building: @associate.address_building, address_city: @associate.address_city, address_landmark: @associate.address_landmark, address_pincode: @associate.address_pincode, address_street: @associate.address_street, annual_turnover: @associate.annual_turnover, bussiness_category: @associate.bussiness_category, center_id: @associate.center_id, certifications: @associate.certifications, company_name: @associate.company_name, contact_person: @associate.contact_person, contact_person_designation: @associate.contact_person_designation, display_hours_status: @associate.display_hours_status, email_id: @associate.email_id, fax_number: @associate.fax_number, fax_number_two: @associate.fax_number_two, first_name: @associate.first_name, friday_from: @associate.friday_from, friday_status: @associate.friday_status, friday_to: @associate.friday_to, landline_number: @associate.landline_number, last_name: @associate.last_name, mobile_number: @associate.mobile_number, monday_from: @associate.monday_from, monday_status: @associate.monday_status, monday_to: @associate.monday_to, number_of_employees: @associate.number_of_employees, payment_mode_id: @associate.payment_mode_id, professional_association: @associate.professional_association, saturday_from: @associate.saturday_from, saturday_status: @associate.saturday_status, saturday_to: @associate.saturday_to, sunday_from: @associate.sunday_from, sunday_status: @associate.sunday_status, sunday_to: @associate.sunday_to, thursday_from: @associate.thursday_from, thursday_status: @associate.thursday_status, thursday_to: @associate.thursday_to, title: @associate.title, toll_free_number: @associate.toll_free_number, toll_free_number_two: @associate.toll_free_number_two, tuesday_from: @associate.tuesday_from, tuesday_status: @associate.tuesday_status, tuesday_to: @associate.tuesday_to, website: @associate.website, wednesday_from: @associate.wednesday_from, wednesday_status: @associate.wednesday_status, wednesday_to: @associate.wednesday_to, year_of_establishment: @associate.year_of_establishment }
    assert_redirected_to associate_path(assigns(:associate))
  end

  test "should destroy associate" do
    assert_difference('Associate.count', -1) do
      delete :destroy, id: @associate
    end

    assert_redirected_to associates_path
  end
end
