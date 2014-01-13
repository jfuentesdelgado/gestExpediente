require 'test_helper'

class RegistrosControllerTest < ActionController::TestCase
  setup do
    @registro = registros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registro" do
    assert_difference('Registro.count') do
      post :create, registro: { : @registro., : @registro., : @registro., : @registro., bultos: @registro.bultos, conocimiento: @registro.conocimiento, estado: @registro.estado, fecha: @registro.fecha, flete: @registro.flete, hora: @registro.hora, matriculaCamion: @registro.matriculaCamion, matriculaRemolque: @registro.matriculaRemolque, numero: @registro.numero, pesobruto: @registro.pesobruto, pesoneto: @registro.pesoneto, precinto1: @registro.precinto1, precinto2: @registro.precinto2, precinto3: @registro.precinto3, procedencia: @registro.procedencia, tipo: @registro.tipo, total: @registro.total }
    end

    assert_redirected_to registro_path(assigns(:registro))
  end

  test "should show registro" do
    get :show, id: @registro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registro
    assert_response :success
  end

  test "should update registro" do
    patch :update, id: @registro, registro: { : @registro., : @registro., : @registro., : @registro., bultos: @registro.bultos, conocimiento: @registro.conocimiento, estado: @registro.estado, fecha: @registro.fecha, flete: @registro.flete, hora: @registro.hora, matriculaCamion: @registro.matriculaCamion, matriculaRemolque: @registro.matriculaRemolque, numero: @registro.numero, pesobruto: @registro.pesobruto, pesoneto: @registro.pesoneto, precinto1: @registro.precinto1, precinto2: @registro.precinto2, precinto3: @registro.precinto3, procedencia: @registro.procedencia, tipo: @registro.tipo, total: @registro.total }
    assert_redirected_to registro_path(assigns(:registro))
  end

  test "should destroy registro" do
    assert_difference('Registro.count', -1) do
      delete :destroy, id: @registro
    end

    assert_redirected_to registros_path
  end
end
