class Skill < ActiveRecord::Base
	validates_presence_of :description
  belongs_to :player
end
