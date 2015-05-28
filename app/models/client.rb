class Client < ActiveRecord::Base
  attr_accessible :address, :contact_no, :email_id, :name, :status

  has_many :bookings  #one to many relation from booking (one client can has many bookings)

  validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i   #regex for checking email id
	
	validates :email_id, length: { maximum: 30 },      #email id is refernce for client so it must be unique in clients table
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: true

	validates :contact_no, length: { maximum: 10, minimum: 8 }, allow_blank: true

	#
	# <description>
	# => make all booking record INACTIVE (status: 0) of particular client_id
	#
	# @param [<integer>] id <client_id>
	#
	# @return [<boolean>] <>
	# 
	def self.booking_deletion(id)
		bookings = Booking.where(client_id: id)
		if bookings.exists?
			bookings.each do |booking|
				booking.update_attributes(status: false)
			end
			return true
		else
			return false
		end
	end

end

