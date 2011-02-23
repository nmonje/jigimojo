class CreatePatrons < ActiveRecord::Migration
  def self.up
    create_table :patrons do |t|
      t.integer :user_id
      t.integer :venue_id
      t.integer :mojo

      t.timestamps
    end
  end

  def self.down
    drop_table :patrons
  end
end
