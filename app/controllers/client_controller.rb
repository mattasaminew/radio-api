class ClientController < ApplicationController
	def home
		render plain: "Backspin API"
	end

	def slug_table
		render json: Show.slug_show_names
	end
end
