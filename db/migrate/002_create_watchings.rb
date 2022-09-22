class CreateWatchings < ActiveRecord::Migration[5.2]
    def change
      create_table :watchings do |t|
        t.string :title
        t.string :movie_or_show
        t.string :image_url
        t.string :streaming_location
        t.integer :creator_id

        t.timestamps null: false
      end
    end
end