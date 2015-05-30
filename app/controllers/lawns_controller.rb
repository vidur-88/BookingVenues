class LawnsController < ApplicationController
	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def create
		@lawn = Lawn.new(address: params[:address], capacity: params[:capacity], location: params[:location], name: params[:name], rate: params[:rate])
		
		if @lawn.save
			if Listing.insert_list(@lawn)
				render json: @lawn, status: 200
			else 
				render json: "lawn save successfull but it not inserted in list", status: 300
			end
		else 
			render json: @lawn.errors, status: 400, location: @lawn
		end
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def new
		@lawn = Lawn.new
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def index
		@lawns = Lawn.all
		render json: @lawns
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def show
		@lawn = Lawn.find(params[:id])
		render json: @lawn
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def edit
		@lawn = Lawn.find(params[:id])
		render json: @lawns
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def update
		@lawn = Lawn.find(params[:id])
		if @lawn.update_attributes(address: params[:address])
			render json: "Lawn data was updated successfully", status: 200
		else
			render json: @lawn.errors, status: 400
		end
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	def destroy
		@lawn = Lawn.find(params[:id])
		if Lawn.listing_deletion(@lawn.id, @lawn.class.name) && @lawn.destroy
			render json: "lawn id #{@lawn.id} was deleted successfully", status: 200
		else
			render json: @lawn.errors, status: 400
		end
	end

    def hello
      name = params[:name]
      x = Lawn.hello(name)
      render json: "#{x}", status: 200
    end
end
