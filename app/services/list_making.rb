class Listing
	#
	# <description>
	# => insert entry into listing views
	#
	# @param [<type>] lawn_hall <description> info of lawn or hall
	# 
	# @return [<boolean>] <description> true if successful insertion, else false
	# 
	def self.insert_list(lawn_hall)
		if !ListingViews.where(imageable_id: lawn_hall.id).exists?
			list = ListingViews.new(imageable_id: lawn_hall.id, imageable_type: lawn_hall.class.name)
			return list.save
		else
			return false
		end
	end

end
