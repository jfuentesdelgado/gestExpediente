class CreateExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes do |t|
      t.string :numero
      t.references :registro, null: false

      t.timestamps
    end
  end
end
