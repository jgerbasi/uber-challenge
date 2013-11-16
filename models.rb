set :database, "sqlite3:///movies.db"
 
class Location < ActiveRecord::Base

  def self.getTitles
    self.all.map {|l| l.title}
  end

  def self.autocomplete(term)
    self.where('lower(title) like ?', term.downcase + "%").map {|l| l.title}.uniq[0..10]
  end
end