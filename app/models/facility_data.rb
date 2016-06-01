class FacilityData < Obj
  attribute :body, :widgetlist
  attribute :facility_id, :string

  def self.scrivito_id_for_facility(facility)
    Digest::SHA1.hexdigest("facility-#{facility.id}")[0...16]
  end

  def self.create_for(facility)
    create(_id: scrivito_id_for_facility(facility), facility_id: facility.id)
  end

  def self.find_for(facility)
    find(scrivito_id_for_facility(facility))
  end
end
