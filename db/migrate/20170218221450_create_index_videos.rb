class CreateIndexVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :index_videos do |t|
      t.string :youtube

      t.timestamps
    end
  end
end
