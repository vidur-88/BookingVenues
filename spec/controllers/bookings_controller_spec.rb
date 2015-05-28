RSpec.describe BookingsController, type: :controller do
	
	it "should has valid date and existing client" do
		post :create, {format: 'json', controller: 'bookings', action: 'create', :end_date => Date.new(2015, 8, 10), :start_date => Date.new(2015, 8, 11), :client_id => 5, :listing_view_id => 19}
		expect(response.status).to eq(200)
	end

	it "show all bookings of client" do
		get :all_booking_of_client, {format: 'json', comtroller: 'bookings', action: 'all_booking_of_client', client_id: 4}
		expect(response.status).to eq(200)
	end

end