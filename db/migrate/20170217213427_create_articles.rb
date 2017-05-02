class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :label_is
      t.string :label_en
      t.text :body_is
      t.text :body_en
      t.string :image
      t.string :youtube

      t.timestamps
    end
  end
end
