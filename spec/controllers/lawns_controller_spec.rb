RSpec.describe LawnsController, type: :controller do
	
	let(:lawn) {FactoryGirl.create(:lawn)}

	it "should be inserted in list" do
		post :create, {format: 'json', controller: 'lawns', action: 'create', address: "Sun Cinemas, Andheri", capacity: 100, location: "Pune", name: "BalajiLawn", rate: 110000.00}
		expect(response.status).to eq(200)
	end

	it " should not voilate its model validation (validates_uniqueness_of :name, scope: [ :address, :location ]) " do
		put :update, {format: 'json', controller: 'lawns', action: 'update', id: 5, address: "Sun Cinemas, Andheri"}
		expect(response.status).to eq(200)
	end

	it "should delete securely" do 
	end

end	