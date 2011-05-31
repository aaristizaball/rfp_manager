require 'test_helper'

class SugestionsControllerTest < ActionController::TestCase
  setup do
    @sugestion = sugestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sugestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sugestion" do
    assert_difference('Sugestion.count') do
      post :create, :sugestion => @sugestion.attributes
    end

    assert_redirected_to sugestion_path(assigns(:sugestion))
  end

  test "should show sugestion" do
    get :show, :id => @sugestion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sugestion.to_param
    assert_response :success
  end

  test "should update sugestion" do
    put :update, :id => @sugestion.to_param, :sugestion => @sugestion.attributes
    assert_redirected_to sugestion_path(assigns(:sugestion))
  end

  test "should destroy sugestion" do
    assert_difference('Sugestion.count', -1) do
      delete :destroy, :id => @sugestion.to_param
    end

    assert_redirected_to sugestions_path
  end
end
