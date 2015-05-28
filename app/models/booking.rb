class Booking < ActiveRecord::Base
  attr_accessible :end_date, :start_date, :client_id, :listing_view_id, :status

  # self.status = true

  belongs_to :listing_views, foreign_key: :listing_view_id    #associated with listing views
  belongs_to :clients, foreign_key: :client_id    #associated with clients            

  validates :start_date, presence: true  #start date and end date can't be blank
  validates :end_date, presence: true

end
