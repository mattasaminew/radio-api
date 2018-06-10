class ShowsController < ApplicationController
	def index
		render json: Show.deduped_shows
	end

	def show
		show = Show.find(params[:id])
		render json: ShowFile.select_from_show_name(show.name)
	end

	def show_episode
		show = ShowFile.find(params[:id])
		send_file show.file_path, type: 'audio/mpeg', disposition: 'inline'
	end
end
