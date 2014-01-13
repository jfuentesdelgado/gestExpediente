class CreateBarcos < ActiveRecord::Migration
  def change
    create_table :barcos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
