class Lawn < ActiveRecord::Base
  attr_accessible :address, :capacity, :location, :name, :rate

  has_one :listing_views, as: :imageable    #one to one relation from listing views

  validates_uniqueness_of :name, scope: [ :address, :location ]  #check for preventing duplicate data entry
                                                                 #assuming (name, address, location) as a must be unique

  #address, capacit, location, name, rate can't be blank
  validates :address, presence: true 
  validates :capacity, presence: true, numericality: { greater_than: 10 }  #assuming capacity atleast 10
  validates :location, presence: true 
  validates :name, presence: true
  validates :rate, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 1000 } #assuming rate at least 1000 and also checking decimal value for 2 precision

  #
  # <description>
  # => remove entry from viewing lists
  #
  # @param [<string>] id <imageable_id>
  # @param [<string>] class_name <imageable_type>
  #
  # @return [<boolean>] <description> true if success, else false
  # 
  def self.listing_deletion(id, class_name)
    listings = ListingViews.where(imageable_id: id, imageable_type: class_name)
    if listings.exists
      listings.each do |listing|
        listing.destroy
      end
      return true
    else 
      return false
    end
  end

end


