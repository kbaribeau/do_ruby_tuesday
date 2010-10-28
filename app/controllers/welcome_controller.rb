class WelcomeController < ApplicationController
	def index
		render "index", :layout => true
	end
end
