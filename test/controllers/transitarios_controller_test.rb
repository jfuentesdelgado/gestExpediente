require 'test_helper'

class TransitariosControllerTest < ActionController::TestCase
  setup do
    @transitario = transitarios(:conregistro)
    @transitarioborrable= transitarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transitarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transitario" do
    assert_difference('Transitario.count') do
      post :create, transitario: { nombre: @transitario.nombre }
    end

    assert_redirected_to transitario_path(assigns(:transitario))
  end

  test "should show transitario" do
    get :show, id: @transitario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transitario
    assert_response :success
  end

  test "should update transitario" do
    patch :update, id: @transitario, transitario: { nombre: @transitario.nombre }
    assert_redirected_to transitario_path(assigns(:transitario))
  end

  test "should destroy transitario" do
    assert_difference('Transitario.count', -1) do
      delete :destroy, id: @transitarioborrable
    end

    assert_redirected_to transitarios_path
  end
end
