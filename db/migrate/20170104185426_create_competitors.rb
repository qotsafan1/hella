class CreateCompetitors < ActiveRecord::Migration[5.0]
  def change
    create_table :competitors do |t|
      t.belongs_to :group, foreign_key: true
      t.string :name
      t.integer :laps
      t.time :total_time
      t.time :finish_time
      t.integer :place_in_group
      t.integer :year

    end
  end
end
