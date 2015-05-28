require 'test_helper'

class RagesControllerTest < ActionController::TestCase
  setup do
    @rage = rages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rage" do
    assert_difference('Rage.count') do
      post :create, rage: { description: @rage.description, picture: @rage.picture, title: @rage.title }
    end

    assert_redirected_to rage_path(assigns(:rage))
  end

  test "should show rage" do
    get :show, id: @rage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rage
    assert_response :success
  end

  test "should update rage" do
    patch :update, id: @rage, rage: { description: @rage.description, picture: @rage.picture, title: @rage.title }
    assert_redirected_to rage_path(assigns(:rage))
  end

  test "should destroy rage" do
    assert_difference('Rage.count', -1) do
      delete :destroy, id: @rage
    end

    assert_redirected_to rages_path
  end
end
