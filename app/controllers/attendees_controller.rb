class AttendeesController < ApplicationController
  # GET /attendees/new
  # GET /attendees/new.xml
  def new
    @attendee = Attendee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendee }
    end
  end

  # GET /attendees/1/edit
  def edit
    @attendee = Attendee.find(params[:id])
  end

  # POST /attendees
  # POST /attendees.xml
  def create
  	if params[:venue_id]
  		venue_id = params[:venue_id]
  	elsif params[:attendee][:venue_id]
  		venue_id = params[:attendee][:venue_id]
		end
		if not current_user.nil?
			user_id = current_user.id
		elsif params[:user_id]
  		user_id = params[:user_id]
		elsif params[:attendee][:user_id]
  		user_id = params[:attendee][:user_id]
		end
  	previous = Attendee.find_all_by_user_id(user_id)
  	if not previous.nil?
  		previous.each {|p| p.destroy}
  	end
    @attendee = Attendee.new(:user_id => user_id, :venue_id => venue_id, :time => Time.now)
    
    @patron = Patron.find_by_user_id_and_venue_id(@attendee.user_id, @attendee.venue_id)
    if @patron.nil?
    	@patron = Patron.new(:user_id => @attendee.user_id, :venue_id => @attendee.venue_id,
    											 :mojo => 1)
			@patron.save
		else
			@patron.update_attributes(:mojo => @patron.mojo+1)
		end
    respond_to do |format|
      if @attendee.save
        format.html { redirect_to(root_path, :notice => 'Attendee was successfully created.') }
        format.xml  { render :xml => @attendee, :status => :created, :location => @attendee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendees/1
  # PUT /attendees/1.xml
  def update
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to(@attendee, :notice => 'Attendee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.xml
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to(attendees_url) }
      format.xml  { head :ok }
    end
  end
end
