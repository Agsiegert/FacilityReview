require 'spec_helper'

describe "Navigate facilities" do
  it "can navigate from show page to the index page" do
    facility = Facility.create!(facility_attributes)

    visit facility_path(facility)

    click_link "Back to All Facilities"

    expect(current_path).to eq(facilities_path)
  end

  it "can navigate from index page to the show page" do
    facility = Facility.create!(facility_attributes)

    visit facilities_path

    click_on "Select Facility"

    expect(current_path).to eq(facility_path(facility))
  end
end
