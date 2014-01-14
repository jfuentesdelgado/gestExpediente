class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :numero , null:false
      t.string :tipo, limit: 1, null: false 
      t.date :fecha, null: false
      t.time :hora, null: false
      t.references :cliente, null: false
      t.integer :bultos, null: false
      t.references :mercancia, null: false
      t.string :matriculaCamion, null: false
      t.string :matriculaRemolque, null: false
      t.integer :pesoneto, null: false
      t.integer :pesobruto, null: false
      t.string :procedencia, null: false
      t.references :transitario, null: false
      t.references :barco, null: false
      t.string :conocimiento, null: false
      t.string :precinto1, null: true
      t.string :precinto2, null: true
      t.string :precinto3, null: true
      t.string :flete, null: false
      t.integer :total, null: false
      t.string :estado, null: false
      t.timestamps
      
    end
  end
end
