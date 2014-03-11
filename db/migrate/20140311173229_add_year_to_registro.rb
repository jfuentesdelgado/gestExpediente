class AddYearToRegistro < ActiveRecord::Migration
  def change
    add_column :registros, :year, :integer
  end
end
