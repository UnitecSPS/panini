class Patito < ActiveRecord::Migration
  def change
  	Player.all.each do |player|
  		puts player.name
  	end
  end
end
