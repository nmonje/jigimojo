class TestingsController < ApplicationController
  # GET /testings
  # GET /testings.xml
  def index
    @testings = Testing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testings }
    end
  end

  # GET /testings/1
  # GET /testings/1.xml
  def show
    @testing = Testing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testing }
    end
  end

  # GET /testings/new
  # GET /testings/new.xml
  def new
    @testing = Testing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testing }
    end
  end

  # GET /testings/1/edit
  def edit
    @testing = Testing.find(params[:id])
  end

  # POST /testings
  # POST /testings.xml
  def create
    @testing = Testing.new(params[:testing])

    respond_to do |format|
      if @testing.save
        format.html { redirect_to(@testing, :notice => 'Testing was successfully created.') }
        format.xml  { render :xml => @testing, :status => :created, :location => @testing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testings/1
  # PUT /testings/1.xml
  def update
    @testing = Testing.find(params[:id])

    respond_to do |format|
      if @testing.update_attributes(params[:testing])
        format.html { redirect_to(@testing, :notice => 'Testing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testings/1
  # DELETE /testings/1.xml
  def destroy
    @testing = Testing.find(params[:id])
    @testing.destroy

    respond_to do |format|
      format.html { redirect_to(testings_url) }
      format.xml  { head :ok }
    end
  end
end
