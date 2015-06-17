require 'test_helper'

class MyragesControllerTest < ActionController::TestCase
  setup do
    @myrage = myrages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:myrages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create myrage" do
    assert_difference('Myrage.count') do
      post :create, myrage: {  }
    end

    assert_redirected_to myrage_path(assigns(:myrage))
  end

  test "should show myrage" do
    get :show, id: @myrage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @myrage
    assert_response :success
  end

  test "should update myrage" do
    patch :update, id: @myrage, myrage: {  }
    assert_redirected_to myrage_path(assigns(:myrage))
  end

  test "should destroy myrage" do
    assert_difference('Myrage.count', -1) do
      delete :destroy, id: @myrage
    end

    assert_redirected_to myrages_path
  end
end
