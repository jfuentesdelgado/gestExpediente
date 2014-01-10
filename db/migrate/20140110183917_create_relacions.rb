class CreateRelacions < ActiveRecord::Migration
  def change
    create_table :relacions do |t|
      t.string :nombre
      t.references :cliente
      t.references :mercancia

      t.timestamps
    end
  end
end
