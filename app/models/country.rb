class Country < ActiveRecord::Base
	validates_presence_of :name, message: "debe estar presente"
	validates_uniqueness_of :email, :position
	validates_inclusion_of :position, in: 1..200
end
