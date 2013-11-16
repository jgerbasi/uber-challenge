require 'sinatra'
require 'sinatra/activerecord'
require File.dirname(__FILE__) + '/models.rb'
require 'json'

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
  @names = Location.getTitles
  @names.to_json
end