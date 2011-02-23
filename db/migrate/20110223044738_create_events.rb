class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :venue_id
      t.string :title
      t.text :description
      t.time :time

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
