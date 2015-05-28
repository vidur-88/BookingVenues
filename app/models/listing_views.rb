class ListingViews < ActiveRecord::Base
  attr_accessible :imageable_id, :imageable_type

  belongs_to :imageable, polymorphic: true, foreign_key: :imageable_id   #polymorphic association from lawns and halls table
  has_many :bookings #one to many relation from bookings

  #imeageable_id and imageable_type can't be blank
  validates :imageable_id, presence: true
  validates :imageable_type, presence: true
  
end
