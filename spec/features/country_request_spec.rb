require 'rails_helper'

describe "country page" do
	before(:each) do
		FactoryGirl.create(:user, email: "patito@granja.com")
		visit login_path
		fill_in "email", with: "patito@granja.com"
		fill_in "password", with: "cuakcuak"
		click_button "Login"
	end

	describe "new country" do
		it "save succesfully a new country" do
			visit new_country_path
			fill_in "country_position", with: 2
			fill_in "country_name", with: "Honduras"
			fill_in "country_email", with: "hon@fenafuth.org"
			click_button "Create Country"
			expect(current_path).to eq(countries_path)
			within("#content") do
				expect(page).to have_content("Honduras")
				expect(page).to have_link("Honduras")
			end
		end
 
		it "stays in new page if something fail" do
			visit new_country_path
			fill_in "country_position", with: 250
			click_button "Create Country"
			expect(page).to have_selector("#form_errors")
		end
	end

	describe "show page" do
		before(:each) do
			@country = FactoryGirl.create(:country)
		end

		it "display country info" do
			visit countries_path
			click_link @country.name
			expect(page).to have_content(@country.name)
			expect(page).to have_link("Nueva Vista", 
				href: "/countries/#{@country.id}/players/new")
		end
	end
end