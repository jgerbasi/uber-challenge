require "./app"

Location.all.each do |l|
  if !l.location.blank?
    sleep(1) # To avoid exceeding geocoding limits
    geoObj = Geocoder.search(l.location + " San Fransisco California")[0]
    if !geoObj.nil?
      l.latitude = geoObj.latitude
      l.longitude = geoObj.longitude
      l.save!
    end
  end
end