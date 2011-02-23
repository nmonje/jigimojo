require 'test_helper'

class VenuesControllerTest < ActionController::TestCase
  setup do
    @venue = venues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue" do
    assert_difference('Venue.count') do
      post :create, :venue => @venue.attributes
    end

    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should show venue" do
    get :show, :id => @venue.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @venue.to_param
    assert_response :success
  end

  test "should update venue" do
    put :update, :id => @venue.to_param, :venue => @venue.attributes
    assert_redirected_to venue_path(assigns(:venue))
  end

  test "should destroy venue" do
    assert_difference('Venue.count', -1) do
      delete :destroy, :id => @venue.to_param
    end

    assert_redirected_to venues_path
  end
end
