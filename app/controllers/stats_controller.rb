require 'json'

class StatsController < ApplicationController
  def index
	# Turn off SSL for now
	ctx = OpenSSL::SSL::SSLContext.new
	ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	# GET Request to strava to get ALL stats for the hardcoded athlete id
	body = HTTP.get("https://www.strava.com/api/v3/athletes/2665988/stats", :ssl_context => ctx, :params => {:access_token => "397ecd551200ef80d5b67bb3ccdd4cb8edccd01a"})
	
	# parse the JSON response and put it into an Hash instance variable 
	@stats = JSON.parse(body)
	
	# render the default view for this controller and action, i.e., stats#index
	render
  end
  
  def search
	# Turn off SSL for now
	ctx = OpenSSL::SSL::SSLContext.new
	ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	# GET Request to strava to get ALL stats for the hardcoded athlete id
	body = HTTP.get("https://www.strava.com/api/v3/athletes/2665988/stats", :ssl_context => ctx, :params => {:access_token => "397ecd551200ef80d5b67bb3ccdd4cb8edccd01a"})
	
	# parse the JSON response and put it into an Hash instance variable 
	@stats = JSON.parse(body)
	
	# pull out the specific stat in question which was passed as a request param
	@stat = @stats[params[:stat_name]];
	
	# render the default view for this controller and action, i.e., stats#show
	render
  end
end
