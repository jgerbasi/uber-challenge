# Sqlite3 database handler
set :database, "sqlite3:///movies.db"
 
class Location < ActiveRecord::Base

  # Only return locations w/ valid coordiantes
  scope :geocoded, where('latitude is not null and longitude is not null')

  def self.markers
    self.geocoded.select([:latitude, :longitude, :title])
  end

  def self.filter_markers(title)
    self.geocoded.where(:title => title).select([:latitude, :longitude, :title])
  end

  # Returns autocomplete results based on search term
  # This is case insensitive 
  # Returns first 15 (for JSON optimization)
  def self.autocomplete(term)
    self.geocoded.where('lower(title) like ?', term.downcase + "%").map {|l| l.title}.uniq[0..15]
  end
end