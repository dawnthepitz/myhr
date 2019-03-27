class TestController < ApplicationController
	def hello_world
		@name = params[:name]
		#render json: {"message":"Hello #{name}"}
	end

	def mock_sms_request
		render json: {code: 201}
	end
end
