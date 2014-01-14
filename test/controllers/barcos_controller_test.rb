require 'test_helper'

class BarcosControllerTest < ActionController::TestCase
  setup do
    @barco = barcos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barcos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barco" do
    assert_difference('Barco.count') do
      post :create, barco: { nombre: @barco.nombre }
    end

    assert_redirected_to barco_path(assigns(:barco))
  end

  test "should show barco" do
    get :show, id: @barco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barco
    assert_response :success
  end

  test "should update barco" do
    patch :update, id: @barco, barco: { nombre: @barco.nombre }
    assert_redirected_to barco_path(assigns(:barco))
  end

  test "should destroy barco" do
    assert_difference('Barco.count', -1) do
      delete :destroy, id: @barco
    end

    assert_redirected_to barcos_path
  end
end
