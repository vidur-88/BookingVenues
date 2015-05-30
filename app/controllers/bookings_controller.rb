class BookingsController < ApplicationController

	#
	# <description>
	# => creating booking
	# => Before creating booking validating start date and end date
	#
	# @return [<type>] <description>
	# 
	def create
		@booking = Booking.new(end_date: params[:end_date], start_date: params[:start_date], client_id: params[:client_id], listing_view_id: params[:listing_view_id])

		if DateValidation.date_cannot_be_in_the_past(params[:start_date], params[:end_date]) && DateValidation.end_date_should_be_greater_than_start(params[:start_date], params[:end_date])
			if @booking.save
				render json: @booking, status: 200
			else 
				render json: @booking.errors, status: 400, location: @boooking
			end
		else 
			render json: "Please check your start and end date", status: 300
		end
	end


	#
	# <description>
	# => showing booking details for particular booking id
	#
	# @return [<type>] <description>
	# 
	def show
		@booking = Booking.find(params[:id])
		render json: @booking, status: 200
	end

	#

	# <description>
	# => show all booking details for particular client
	#
	# @return [<type>] <description>
	# 
	def all_booking_of_client
		@bookings = Booking.where(client_id: params[:client_id])
		render json: @bookings, status: 200
	end

end
