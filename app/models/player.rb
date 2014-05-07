class Player < ActiveRecord::Base
	validates_presence_of :name
	validates_inclusion_of :number, in: 0..640
	validates_uniqueness_of :number
 	belongs_to :country

 	def formatted_birthday
 		self.birthday.strftime("%d %B,%Y")
 	end
end
