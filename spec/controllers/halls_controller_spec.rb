RSpec.describe HallsController, type: :controller do
	
	let(:hall) {FactoryGirl.create(:hall)}

	it "should be inserted in list" do
		post :create, {format: 'json', controller: 'halls', action: 'create', address: "Fun Cinemas, Andheri", capacity: 50, location: "Mumbai", name: "FUNHALL", rate: 10000.00}
		expect(response.status).to eq(200)
	end

	it "should delete securely" do
		delete :destroy, {format: 'json', controller: 'halls', action: 'destroy', id: 24}
		expect(response.status).to eq (200)
	end

end	