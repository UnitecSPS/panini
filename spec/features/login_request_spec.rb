require 'rails_helper'

describe "login page" do

	before(:each) do
		FactoryGirl.create(:user, email: "patito@granja.com")
	end

	it "can successfully log in" do
		visit login_path
		expect(page).to have_content("LOGIN")
		fill_in "email", with: "patito@granja.com"
		fill_in "password", with: "cuakcuak"
		click_button "Login"
		expect(current_path).to eq(countries_path)
		within("#content") do
			expect(page).to have_content("Paises")
		end

	end

	it "stay in login if this fail" do
		visit login_path
		fill_in "email", with: "patito@granja.com"
		click_button "Login"
		expect(current_path).to eq(login_path)
	end
end