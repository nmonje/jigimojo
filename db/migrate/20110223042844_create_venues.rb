class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.float :lat
      t.float :lng
      t.string :current_song_name
      t.string :current_song_artist

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
