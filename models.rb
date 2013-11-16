set :database, "sqlite3:///movies.db"
 
class Location < ActiveRecord::Base
  def self.getTitles
    return Location.all.map {|l| l.title}
  end
end