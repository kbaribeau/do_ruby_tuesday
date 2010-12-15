require 'net/http'

class AuthController < ApplicationController
	def initialize
		if @client.nil?
			@client = TwitterOAuth::Client.new( 
				:consumer_key => 'TFzFh0qEhFGjA5uHWAJBCQ',
				:consumer_secret => 'vxegxZn5AeZ3Tzl5NaMz4LsulAkFLH0BlIjo9vjkEEU' 
			)
		end
	end

	def index
		request_token = @client.request_token(
			:oauth_callback => url_for(:controller => 'auth', :action => 'callback')
		)
		session[:request_token] = request_token.token
		session[:request_token_secret] = request_token.secret
		redirect_to request_token.authorize_url.gsub('authorize', 'authenticate')
	end

	def callback
		@access_token = @client.authorize(
			session[:request_token],
			session[:request_token_secret],
			:oauth_verifier => params[:oauth_verifier]	
		)

		if @client.authorized?
			session[:access_token] = @access_token.token
			session[:secret_token] = @access_token.secret
			session[:user] = true
			redirect_to '/'
		else
			redirect_to 'failed'
		end
	end
end
