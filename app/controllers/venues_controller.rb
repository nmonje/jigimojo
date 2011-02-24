class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.xml
  def index
    @user = current_user
    @venues = @user.venues

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
      format.json { render :json => @venues }
    end
  end

	def search
	end
	
	def lookup
		lat = params[:lat]
		lng = params[:lng]
		@venue = Venue.find_by_lat_and_lng(lat, lng)
		
		respond_to do |format|
			format.html
			format.json { render :json => @venue.id }
		end
	end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue }
      format.json { render :json => @venue }
    end
  end
  
  def attendees
  	@venue = Venue.find(params[:id])
  	attendees = []
  	@venue.attendees.each do |a|
  		user = User.find_by_id(a.user_id)
  		patron = Patron.find_by_user_id_and_venue_id(user.id, @venue.id)
  		attendee = {:name => user.name, :mojo => patron.mojo}
  		attendees << attendee
  	end
  		respond_to do |format|
  		format.json { render :json => attendees }
		end
	end
  
  
  def current_song
  	@venue = Venue.find(params[:id])
  	song = {:title => @venue.current_song_name, :artist => @venue.current_song_artist}
  	respond_to do |format|
  		format.json { render :json => song}
  	end
  end

  # GET /venues/new
  # GET /venues/new.xml
  def new
    @venue = Venue.new
    @venue.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.xml
  def create
    @venue = Venue.new(params[:venue])
    @venue.user_id = current_user.id

    respond_to do |format|
      if @venue.save
        format.html { redirect_to(@venue, :notice => 'Venue was successfully created.') }
        format.xml  { render :xml => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.xml
  def update
    @venue = Venue.find(params[:id])
		remove_old_attendees
		give_mojo(@venue)
				
    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to(@venue, :notice => 'Venue was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.xml
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to(venues_url) }
      format.xml  { head :ok }
    end
  end

	def remove_old_attendees
		Attendee.all.each do |attendee|
			if (Time.now - attendee.time > 1.hour)
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
