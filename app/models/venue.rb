class Venue < ActiveRecord::Base
	validates_presence_of :user_id, :title
	
	belongs_to :user
	has_many :patrons
	has_many :events
	has_many :attendees
	
end
