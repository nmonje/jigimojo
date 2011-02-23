class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relations
  end
end
