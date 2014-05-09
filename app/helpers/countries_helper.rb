module CountriesHelper
	def link_a_new_country
		link_to "Agregar Pais", new_country_path
	end

	def index_description
		content_tag(:p) do
			content_tag(:em,"Estos son los paises que han calificado al mundial de Brasil 2014")
		end
	end

	def percentage
		av = (Player.own.count*100)/Player.count
		"#{av}%"
	end
end
