class Hall < ActiveRecord::Base
  attr_accessible :address, :capacity, :location, :name, :rate

  has_one :listing_views, as: :imageable  #one to one relation from listing views

  validates_uniqueness_of :name, scope: [ :address, :location ]  #prevent from duplicate data entry

  validates :capacity, presence: true, numericality: { greater_than: 10 }  #assuming capacity atleast 10
  validates :location, presence: true #location can't be blank
  validates :name, presence: true #name can't be blank
  validates :rate, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 1000 } #assuming rates minimum 1000


  # <description>
  # => remove entry from listing view 
  #
  # @param [<string>] id <imageable_id>
  # @param [<striing>] class_name <imageable_type>
  #
  # @return [<boolean>] <description> true if success, else false
  # 
  def self.listing_deletion(id, class_name)
    listings = ListingViews.where(imageable_id: id).where(imageable_type: class_name)
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


