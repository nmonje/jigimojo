class Patron < ActiveRecord::Base
validates_presence_of :user_id, :venue_id, :mojo

belongs_to :venue

end
