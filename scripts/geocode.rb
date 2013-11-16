# This uses the geocoder gem/google geocoding API to obtain coordinates for location data

require "./app"

Location.all.each do |l|
  if !l.location.blank?
    sleep(1) # To avoid exceeding geocoding request limits

    # Append San Fransisco, California to get better results
    geoObj = Geocoder.search(l.location + " San Fransisco, California")[0]
    
    if !geoObj.nil?
      l.latitude = geoObj.latitude
      l.longitude = geoObj.longitude
      l.save!
    end
  end
end