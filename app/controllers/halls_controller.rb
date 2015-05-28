class HallsController < ActionController::Base
	
	#
	# <description>
	# => creating new entry of hall
	# => also inserting this new hall info in LisitingViews
	# @return [<type>] <description>
	# 
	def create
		@hall = Hall.new(address: params[:address], capacity: params[:capacity], location: params[:location], name: params[:name], rate: params[:rate])
		if @hall.save
			if Listing.insert_list(@hall)
				render json: @hall, status: 200
			else 
				render json: "hall save but not inserted in list", status: 300
			end
		else
			render json: @hall.errors, status: 400, location: @hall
		end
	end

	# def new
	# 	@hall = Hall.new
	# end

	#
	# <description>
	# => show all halls
	#
	# @return [<type>] <description>
	# 
	def index
		@halls = Hall.all
		render json: @halls
	end

	#
	# <description>
	# => show hall by its hall id
	#
	# @return [<type>] <description>
	# 
	def show
		@hall = Hall.find(params[:id])
		render json: @hall
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	# def edit
	# 	@hall = Hall.find(params[:id])
	# end

	#
	# <description>
	# => update hall attributes
	#
	# @return [<type>] <description>
	# 
	def update
		@hall = Hall.find(params[:id])
		if @hall.update_attributes(params[:hall])
			render json: "hall was updated successfully", status: 200
		else
			render json: @hall.errors, status: 400
		end
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def destroy
		@hall = Hall.find(params[:id])
		if Hall.listing_deletion(@hall.id, @hall.class.name) && @hall.destroy
			render json: "hall id #{@hall.id} was deleted successfully", status: 200
		else
			render json: @hall.errors, status: 400
		end
	end

end
