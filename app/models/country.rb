class Country < ActiveRecord::Base
	validates_presence_of :name, message: "debe estar presente"
	validates_uniqueness_of :email, :position
	validates_inclusion_of :position, in: 1..200

	has_many :players

	before_save :verify_name
	before_create :check_call
	before_update :test

	protected 

		def verify_name
			self.name = self.name.titleize
		end

		def check_call
			puts "Se llamo before save"
		end

		def test
			puts "-llamando a before update"
			#self.name = "patito"
			#save
		end
end
