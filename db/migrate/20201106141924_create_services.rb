class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.integer :duration
      t.integer :correction_time

      t.timestamps
    end
  end
end
