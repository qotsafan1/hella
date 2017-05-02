class CreateLaptimes < ActiveRecord::Migration[5.0]
  def change
    create_table :laptimes do |t|
      t.belongs_to :competitor, foreign_key: true
      t.integer :lap_number
      t.text :laptime

    end
  end
end
