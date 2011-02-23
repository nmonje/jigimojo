class DeviseCreateVenues < ActiveRecord::Migration
  def self.up
    create_table(:venues) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.integer :city_id
      t.text :description
      t.string :current_song_name
      t.string :current_song_artist

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :venues, :email,                :unique => true
    add_index :venues, :reset_password_token, :unique => true
    # add_index :venues, :confirmation_token,   :unique => true
    # add_index :venues, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :venues
  end
end
