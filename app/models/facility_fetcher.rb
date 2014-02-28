class FacilityFetcher < ActiveRecord::Base

  validates :location, :presence => true
  after_create :get_lat_long

  def get_lat_long
    results = Geocoder.search(location)
    latitude = results.first.data["geometry"]["location"]["lat"]
    longitude = results.first.data["geometry"]["location"]["lng"]
    update(:latitude => latitude, :longitude => longitude) if latitude && longitude
  end

  def get_facilities
    response = Faraday.get "https://www.itriagehealth.com/api/v1/medical_providers.json?search_model=medical_facilities&per_page=20&sort_by=featured&distance=25&medical_facility_categories=2&medical_facility_sub_categories=&family_member_id=null&lat=#{latitude}&lng=#{longitude}"
    response.status
    facilities = JSON.parse(response.body)["results"].map do |facility|
      attributes = {
        :iTriage_id => facility["id"],
        :name       => facility["name"],
        :phone      => facility["phone"],
        :tagline    => facility["tagline"],
        :logo_url   => facility["logo_url"],
        :street     => facility["street"],
        :street2    => facility["street2"],
        :city       => facility["city"],
        :state      => facility["state_abbreviated"],
        :zip        => facility["zip"]
      }
      @facility = Facility.find_or_create_by(attributes)
    end
  end
end
