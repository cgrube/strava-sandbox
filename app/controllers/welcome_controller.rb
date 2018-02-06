require 'http'

class WelcomeController < ApplicationController
  def index
	@profile = session[:user_profile]
  end
end
