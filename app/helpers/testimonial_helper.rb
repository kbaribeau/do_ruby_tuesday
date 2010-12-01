module TestimonialHelper
	def twitter_oauth_url
		@consumer=OAuth::Consumer.new( "TFzFh0qEhFGjA5uHWAJBCQ","vxegxZn5AeZ3Tzl5NaMz4LsulAkFLH0BlIjo9vjkEEU", {
			:site=>"https://agree2"
		})

		@request_token=@consumer.get_request_token
		session[:request_token]=@request_token
		@request_token.authorize_url
	end
end
