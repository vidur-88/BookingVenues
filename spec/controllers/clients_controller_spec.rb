RSpec.describe ClientsController, type: :controller do

	let(:client) { FactoryGirl.create(:client) }

	it "should create valid client" do
		post :create, {format: 'json', controller: 'clients', action: 'create', name: "vik", email_id: "aaaabscn111111234@gmail.com", contact_no: "9577454757", address: "Pandeypur, Varanasi"}
		expect(response.status).to eq(200)
	end

	it "show all clients" do
		get :show, {format: 'json', controller: 'clients', action: 'show', id: 1}
		expect(response.status).to eq(200)
	end

	it "should make status INACTIVE(0) insteead of deletion" do
		put :inactive_client, {format: 'json', controller: 'clients', action: 'inactive_client', id: 5}
		expect(response.status).to eq(200)
	end
	
end