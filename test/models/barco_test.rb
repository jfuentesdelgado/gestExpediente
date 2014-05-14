require 'test_helper'

class BarcoTest < ActiveSupport::TestCase
 
  # test "the truth" do
  #   assert true
  # end
   test "no borrar un barco que tenga registro asociados" do
   	 barconoborrar = Barco.find(1)
     assert_difference('Barco.count', 0) do
       barconoborrar.destroy
     end   
   end
end
