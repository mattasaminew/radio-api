class ShowsController < ApplicationController
	def home
		render plain: "Airtime Rails API"
	end

	def index
		render json: Show.deduped_shows
	end

	def show
		show = Show.find(params[:id])
		render json: ShowFile.select_from_show_name(show.name)
	end
end
