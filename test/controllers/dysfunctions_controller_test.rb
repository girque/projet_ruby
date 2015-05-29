require 'test_helper'

class DysfunctionsControllerTest < ActionController::TestCase
  setup do
    @dysfunction = dysfunctions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dysfunctions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dysfunction" do
    assert_difference('Dysfunction.count') do
      post :create, dysfunction: { picture: @dysfunction.picture }
    end

    assert_redirected_to dysfunction_path(assigns(:dysfunction))
  end

  test "should show dysfunction" do
    get :show, id: @dysfunction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dysfunction
    assert_response :success
  end

  test "should update dysfunction" do
    patch :update, id: @dysfunction, dysfunction: { picture: @dysfunction.picture }
    assert_redirected_to dysfunction_path(assigns(:dysfunction))
  end

  test "should destroy dysfunction" do
    assert_difference('Dysfunction.count', -1) do
      delete :destroy, id: @dysfunction
    end

    assert_redirected_to dysfunctions_path
  end
end
