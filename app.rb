require 'sinatra'
require 'sinatra/activerecord'
require File.dirname(__FILE__) + '/models.rb'
require 'json'
require 'geocoder'

set :environment, :production

disable :show_exceptions
disable :raise_errors

# Make all requests default to JSON response
before do
  content_type 'application/json'
end

# Main Page (HTML)
get "/" do 
  content_type 'html'
  send_file 'public/index.html'
end

# GET /markers
# GET /markers?title=title
# Example: /markers?title=basic+instinct
get "/markers" do
  if params[:title]
    @markers = Location.filter_markers(params[:title])
  else
    @markers = Location.markers
  end
  @markers.to_json
end


# Returns autocomplete results based on search query
# GET /autocomplete?term=term
# Example: /autocomplete?term=basic+ins
get "/autocomplete" do
  Location.autocomplete(params[:term]).to_json
end

# 404 Catch-all for bad routes
get "/*" do
  status 404
  body '404 Error - This Page Does Not Exist'
end