class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :venue_id
      t.time :time

      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
