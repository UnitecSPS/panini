class Player < ActiveRecord::Base
	validates_presence_of :name
	validates_inclusion_of :number, in: 0..640
	validates_uniqueness_of :number
 	belongs_to :country
 	has_many :skills

 	default_scope { order("number ASC") }
 	scope :own, -> {where("quantity > 0")}
 	scope :missing, -> {where("quantity = 0")}
 	scope :repeats, -> {where("quantity > 1")}

 	def formatted_birthday
 		self.birthday.strftime("%d %B,%Y")
 	end

 	def self.complicated_sql(p1,p2=1)
 		#.find_by_sql
 	end
end
