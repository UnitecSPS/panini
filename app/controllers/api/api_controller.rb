class Api::ApiController < ActionController::Base
	before_filter :check_token

	def check_token
		unless params[:token].present? && params[:token] == Rails.configuration.api_key
			render text: "Api Not Valid", status: :unauthorized
		end
	end
end