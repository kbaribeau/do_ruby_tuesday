class WelcomeController < ApplicationController
	def index
		@user = session[:user]
		render "index", :layout => true
	end
end
