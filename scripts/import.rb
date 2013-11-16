require 'csv'
require "./app"   

csv_text = File.read('./data/Film_Locations_in_San_Francisco.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  l = Location.new
  l.title = row["Title"]
  l.release_year = row["Release Year"]
  l.location = row["Locations"]
  l.fun_facts = row["Fun Facts"]
  l.production_company = row["Production Company"]
  l.distributor = row["Distributor"]
  l.director = row["Director"]
  l.writer = row["Writer"]
  l.actor_1 = row["Actor_1"]
  l.actor_2 = row["Actor_2"]
  l.actor_3 = row["Actor_3"]
  l.save!
end