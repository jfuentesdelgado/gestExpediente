class CreateDuas < ActiveRecord::Migration
  def change
    create_table :duas do |t|
      t.string :dua
      t.references :registro, null: false

      t.timestamps
    end
  end
end
