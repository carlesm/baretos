class RestaurantsController < ApplicationController
include GeoKit::Geocoders

  # GET /restaurants
  # GET /restaurants.xml
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurants }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.xml
  def show
    @restaurant = Restaurant.find(params[:id])

  @resenya = Resenya.new
  @critics = Critic.find(:all, :order=>'nom')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.xml
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.xml
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    loc = MultiGeocoder.geocode(@restaurant.adreca)
    @restaurant.lat = loc.lat
    @restaurant.lng = loc.lng

    respond_to do |format|
      if @restaurant.save
        flash[:notice] = 'Restaurant was successfully created.'
        format.html { redirect_to(@restaurant) }
        format.xml  { render :xml => @restaurant, :status => :created, :location => @restaurant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.xml
  def update
    @restaurant = Restaurant.find(params[:id])

    loc = MultiGeocoder.geocode(@restaurant.adreca)
    @restaurant.lat = loc.lat
    @restaurant.lng = loc.lng


    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        flash[:notice] = 'Restaurant was successfully updated.'
        format.html { redirect_to(@restaurant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @restaurant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.xml
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to(restaurants_url) }
      format.xml  { head :ok }
    end
  end


 
  def find_closest
    @location = MultiGeocoder.geocode(params[:location])
    if @location.success
        @restaurants= Restaurant.find(:all, 
		:origin => [@location.lat, @location.lng], 
        	:conditions => "distance < #{params[:radius]}", 						
		:order=>'distance')
    end    
  end


def search
    loc = IpGeocoder.geocode(request.remote_ip)
    @location = []
    @location << loc.street_address << loc.city << loc.country_code
  end


end
