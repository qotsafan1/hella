class CreateKids < ActiveRecord::Migration[5.0]
  def change
    create_table :kids do |t|
      t.text :info_is
      t.text :info_en

      t.timestamps
    end
  end
end
