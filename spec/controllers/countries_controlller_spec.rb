require 'rails_helper'

describe CountriesController do
	describe "Get #show" do
		it "a success page" do
			country = FactoryGirl.create(:country)
			get :show, {id: country.id}, {user_id: 123}
			expect(response.status).to eq(200)
			expect(response).to be_success
		end
	end

	describe "Get #json_test" do
		it "get a hash" do
			get :json_test, {}, {user_id: 123}
			hash = JSON.parse(response.body)
			expect(hash['name']).to eq("something")
		end
	end
end