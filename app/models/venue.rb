class Venue < ActiveRecord::Base
	validates_presence_of :user_id, :title
	
	belongs_to :user
	
end
