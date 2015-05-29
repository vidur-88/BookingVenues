class ListingViewsController < ApplicationController

	#
	# <description>
	# => show all lawns and halls
	#
	# @return [<type>] <description>
	# 
	def index
		# Listing::show_all
		@lists = ListingViews.all
		render json: @lists, status: 200
	end

end
