class ClientsController < ApplicationController

	#
	# <description>
	# => creating new client
	#
	#
	# @return [<type>] <description>
	# 
	def create
		@client = Client.new(name: params[:name], email_id: params[:email_id], contact_no: params[:contact_no], address: params[:address])
		if @client.save
      render json: @client, status: 200
    else
      render json: @client.errors, status: 400, location: @client
    end
	end

	#
	# <description>
	# => showing client doesn't has status 0 (INACTIVE) by id (primary key)
	#
	# @return [<type>] <description>
	# 
	def show
		@client = Client.find(params[:id])
		if @client.status != 0
			render :json => @client, status: 200
		else
			render :json => @client.status, status: 400
		end
	end

	# def new

	# 	@client = Client.new #Client.create(name: "Bagha", email_id: "lh111@gmail.com", contact_no: "", address: "ABC Bhawan, Andheri")
	# 	#render :json => @client
	# end

	#
	# <description>
	# => showing all clients (active or inactive)
	#
	# @return [<type>] <description>
	# 
	def index
		@clients = Client.all
		render :json => @clients
	end

	#
	# <description>
	#
	#
	# @return [<type>] <description>
	# 
	# def edit
	# 	@client = Client.find(params[:id])
	# end

	#
	# <description>
	# => update client
	#
	#
	# @return [<type>] <description>
	# 
	def update
		@client = Client.find(params[:id])
		if @client.status != 0 && @client.update_attributes(params[:client])
			render status: 200
		else
			render json: @client.errors, status: 400
		end
	end

	#
	# <description>
	# => making client INACTIVE (status: 0)
	# => before making client INACTIVE all bookings which belongs to this client making INACTIVE (status: 0)
	# @return [<type>] <description>
	# 
	def inactive_client
		@client = Client.find(params[:id])
		if Client.booking_deletion(@client.id) 
			if @client.update_attributes(status: false)
				render json: "client deletion successful", status: 200
			else 
				render json: "client deletion failed", status: 300
			end
		else
			render json: "client deletion failed", status: 400
		end
	end

end
