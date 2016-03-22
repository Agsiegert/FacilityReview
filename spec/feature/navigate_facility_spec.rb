require 'spec_helper'

describe "Navigate facilities" do
  it "can navigate from show page to the index page" do
    facility = Facility.create!(facility_attributes)

    visit facility_path(facility)

    click_link "Back to All Facilities"

    expect(current_path).to eq(facilities_path)
  end

  it "can navigate from root/locaiton page to the index page" do
    visit root_path

    click_on "Find Facilities Near Me"

    expect(current_path).to eq(facilities_path)
  end
end
