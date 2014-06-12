json.array! @countries do |country|
	json.name 		country.name
	json.position country.position
	json.email		country.email

	json.players country.players do |player|
		json.name 	player.name
		json.number player.number
		json.team		player.team
	end
end