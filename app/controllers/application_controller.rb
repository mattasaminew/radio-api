class ApplicationController < ActionController::API
	before_action :set_cors_headers

	private

	def set_cors_headers
		if allowed_origins.include?(request.headers['Origin'])
			headers['Access-Control-Allow-Origin'] = request.headers['Origin']
			headers['Access-Control-Request-Method'] = 'GET'
			headers['Access-Control-Allow-Headers'] = '*'
			Rails.logger.info "[ApplicationController] Access-Control-Allow-Origin: #{request.headers['Origin']}"
		else
			Rails.logger.info "[ApplicationController] No Access-Control-Allow-Origin set (#{request.headers['Origin']} not in allowed_origins)"
		end
	end

	def allowed_origins
		['http://localhost:4000', 'http://backsp.in', 'https://backsp.in']
	end
end
