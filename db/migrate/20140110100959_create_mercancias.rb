class CreateMercancias < ActiveRecord::Migration
  def change
    create_table :mercancias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
