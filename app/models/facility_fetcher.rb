class FacilityFetcher
  geocoded_by :location
  geocoded_by :ip_address
  after_validation :geocode


  def location
    params[:location]
    # if params[:location] != nil
    #   location = Geocoder.search(params[:location]).first.data["geometry"]["location"]
    #     @longitude = location["lng"]
    #     @latitude = location["lat"]

    #     redirect_to facilities_path(@longitude, @latitude)
    # end
  end

  def self.get_facilities#(lat, long)
    # need to add string interpolation for lat and long to accept geocode data, hard coded with 80204
    response = Faraday.get "https://www.itriagehealth.com/api/v1/medical_providers.json?search_model=medical_facilities&per_page=20&sort_by=featured&distance=25&medical_facility_categories=2&medical_facility_sub_categories=&family_member_id=null&lat=39.7347&lng=-105.0200"
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
