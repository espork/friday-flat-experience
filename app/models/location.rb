class Location < ActiveRecord::Base
  geocoded_by :complete_adress
  after_validation :geocode
  
  def complete_adress
    [adress,zip_code, city, country].compact.join(', ')
  end
end
