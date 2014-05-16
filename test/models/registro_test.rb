require 'test_helper'

class RegistroTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "Mostrar numero correcto" do
  	registro=registros(:one)
  	numero=registro.mostrarNumero
  	assert_equal(numero,"1/14")
  end

  test "Añadir DUA" do

  	registro=Registro.new

  	registro.addDuas (["111","2222"])
  	assert registro.duas[0].dua== "111"
  	assert registro.duas[1].dua== "2222"
  end
end
