class ActivitiesController < ApplicationController
  def index
	# Turn off SSL for now
	ctx = OpenSSL::SSL::SSLContext.new
	ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
	
	# GET Request to strava to get ALL stats for the hardcoded athlete id
	body = HTTP.get("https://www.strava.com/api/v3/athlete/activities", :ssl_context => ctx, :params => {:access_token => "397ecd551200ef80d5b67bb3ccdd4cb8edccd01a"})
	
	print "body: " + body
	
	# parse the JSON response and put it into an Hash instance variable 
	@activities = JSON.parse(body)
	
	print "activities: " + @activities[0]["id"].to_s
	
	# render the default view for this controller and action, i.e., stats#index
	render
  end
end
