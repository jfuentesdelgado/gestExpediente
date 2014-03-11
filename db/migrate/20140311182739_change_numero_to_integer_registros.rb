class ChangeNumeroToIntegerRegistros < ActiveRecord::Migration
  def change
  	change_table :registros do |t|
      t.change :numero, :integer
    end

  end
end
