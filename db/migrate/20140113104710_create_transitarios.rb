class CreateTransitarios < ActiveRecord::Migration
  def change
    create_table :transitarios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
