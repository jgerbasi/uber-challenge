require 'sinatra'
require 'sinatra/activerecord'
require File.dirname(__FILE__) + '/models.rb'
require 'json'
require 'geocoder'

before do
  content_type 'application/json'
end

get "/" do 
  content_type 'html'
  send_file 'public/index.html'
end

get "/locations" do
  @locations = Location.all
  @locations.to_json
end

get "/autocomplete" do
  @term = request.env['rack.request.query_hash']['term']
  Location.autocomplete(@term).to_json
end