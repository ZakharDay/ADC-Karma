class CreateMinors < ActiveRecord::Migration[6.0]
  def change
    create_table :minors do |t|
      t.string :city
      t.string :faculty
      t.string :name
      t.string :page_url

      t.timestamps
    end
  end
end
