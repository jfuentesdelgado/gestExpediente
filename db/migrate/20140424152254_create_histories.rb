class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.date :date
      t.string :original_state
      t.string :final_state
      t.references :registro, null: false

      t.timestamps
    end
  end
end
