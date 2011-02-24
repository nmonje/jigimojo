module VenuesHelper
	def remove_old_attendees
		Attendees.all.each do |attendee|
			if (Time.now - attendee.time > One.hour)
				attendee.destroy
			end
		end
	end
	
	def give_mojo(venue)
		venue.attendees.each do |attendee|
			user = User.find_by_id(attendee.user_id)
			if true # and maybe a more meaningful test?
				patron = Patron.find_by_user_id_and_venue_id(attendee.user_id, venue.id)
				if patron.nil?
					patron = Patron.new(:user_id => attendee.user_id, :venue_id => attendee.venue_id,
    													 :mojo => 1)
    			patron.save
				else
					patron.update_attributes(:mojo => patron.mojo+1)
				end
			end
		end
	end
end
