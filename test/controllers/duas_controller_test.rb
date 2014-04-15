require 'test_helper'

class DuasControllerTest < ActionController::TestCase
  setup do
    @dua = duas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:duas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dua" do
    assert_difference('Dua.count') do
      post :create, dua: { belongs_to: @dua.belongs_to, dua: @dua.dua }
    end

    assert_redirected_to dua_path(assigns(:dua))
  end

  test "should show dua" do
    get :show, id: @dua
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dua
    assert_response :success
  end

  test "should update dua" do
    patch :update, id: @dua, dua: { belongs_to: @dua.belongs_to, dua: @dua.dua }
    assert_redirected_to dua_path(assigns(:dua))
  end

  test "should destroy dua" do
    assert_difference('Dua.count', -1) do
      delete :destroy, id: @dua
    end

    assert_redirected_to duas_path
  end
end
