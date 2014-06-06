FactoryGirl.define do
	sequence :email do |n|
    "test#{n}@example.com"
  end

	factory :user do
		full_name "Patito Feo"
		email
		password "cuakcuak"
		password_confirmation "cuakcuak"
	end
end