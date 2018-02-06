require 'http'

class AuthenticationController < ApplicationController
  def index
  end
  
  def doOauth
	# GET Request to Strava for user to grant permissions
	redirect_to "https://www.strava.com/oauth/authorize?client_id=23094&redirect_uri=http://localhost:3000/authentication/doTokenExchange&response_type=code&approval_prompt=force"
  end
  
  # Action is executed by Strava via the redirect_uri above once the user has granted permissions for this approval_prompt
  # to access Strava
  def doTokenExchange
	# Turn off SSL for now
	ctx = OpenSSL::SSL::SSLContext.new
	ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	# GET Request to Strava to exchange client info for an access token
	body = HTTP.post("https://www.strava.com/oauth/token", :ssl_context => ctx, :params => {:client_id => "23094", :client_secret => "19ed34edde4dc72c9bac1a672e107c67d0d20f7e", :code => params[:code]})
	
	# parse the JSON response to get the access token (used for future requests) and profile information for the user
	@response = JSON.parse(body)
	
	session[:access_token] = @response['access_token']	
	session[:user_profile] = @response['athlete']

	
	puts "access_token: " + session[:access_token]
	puts "user_profile: " + session[:user_profile]['profile']
	
	redirect_to welcome_index_path
  end
end
