require 'test_helper'

class VolentersControllerTest < ActionController::TestCase
  setup do
    @volenter = volenters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volenters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volenter" do
    assert_difference('Volenter.count') do
      post :create, volenter: { address: @volenter.address, adhaar_no: @volenter.adhaar_no, age: @volenter.age, center_id: @volenter.center_id, gender: @volenter.gender, name: @volenter.name, phone_no: @volenter.phone_no }
    end

    assert_redirected_to volenter_path(assigns(:volenter))
  end

  test "should show volenter" do
    get :show, id: @volenter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volenter
    assert_response :success
  end

  test "should update volenter" do
    patch :update, id: @volenter, volenter: { address: @volenter.address, adhaar_no: @volenter.adhaar_no, age: @volenter.age, center_id: @volenter.center_id, gender: @volenter.gender, name: @volenter.name, phone_no: @volenter.phone_no }
    assert_redirected_to volenter_path(assigns(:volenter))
  end

  test "should destroy volenter" do
    assert_difference('Volenter.count', -1) do
      delete :destroy, id: @volenter
    end

    assert_redirected_to volenters_path
  end
end
