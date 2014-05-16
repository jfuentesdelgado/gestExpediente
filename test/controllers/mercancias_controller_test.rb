require 'test_helper'

class MercanciasControllerTest < ActionController::TestCase
  setup do
    @mercancia = mercancias(:one)
    @mercancia_borrable = mercancias(:sinregistro)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mercancias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mercancia" do
    assert_difference('Mercancia.count') do
      post :create, mercancia: { nombre: @mercancia.nombre }
    end

    assert_redirected_to mercancia_path(assigns(:mercancia))
  end

  test "should show mercancia" do
    get :show, id: @mercancia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mercancia
    assert_response :success
  end

  test "should update mercancia" do
    patch :update, id: @mercancia, mercancia: { nombre: @mercancia.nombre }
    assert_redirected_to mercancia_path(assigns(:mercancia))
  end

  test "should destroy mercancia" do
    assert_difference('Mercancia.count', -1) do
      delete :destroy, id: @mercancia_borrable
    end

    assert_redirected_to mercancias_path
  end
end
