class LocationsController < ApplicationController

def index
	# @locations = Location.all #near("Manchester") 


	# if the user has searched for a location
	# search near the place they searched
	#else show all the places near london
	# the param they've searched for is params [:location]

	if params[:location].present?
		# search for the places near params [:location]
		@locations = Location.near(params[:location])

	else
		#search for places near Mancheser
		@locations = Location.near("Manchester")
		
	end
	
end

def new
	@location = Location.new 
	
end

def create
	@location = Location.new(location_params)

	if @location.save
		redirect_to root_path
		
	else
	
		render "new"

	end
end

	def location_params
		params.require(:location).permit(:title, :address, :latitude, :longitude)
	end	

end
