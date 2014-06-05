class SkillsController < ApplicationController
	def create
		@skill = Skill.new(skill_params)

		if @skill.save
			if request.xhr?
				render partial: "skills/skill", locals: {skill: @skill}, status: 200
			else
				redirect_to country_player_path(@skill.player.country, @skill.player)
			end
		else
			render json: @skill.errors.full_messages.to_json, status: 422
		end
	end

	private

		def skill_params
			params.require(:skill).permit!
		end
end