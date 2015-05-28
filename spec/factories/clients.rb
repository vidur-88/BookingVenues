FactoryGirl.define do

	factory :client, :class => Client do
		sequence(:email_id, 10011) {|n| "foo#{n}@example.com"}
  	name "vikash"
  	contact_no "9843752334"
  	address "anddheri west"
	end
	
end