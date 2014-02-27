require 'spec_helper'

describe "shows an individual facility" do
  it "shows the facility"do

    facility = Facility.create!(facility_attributes(phone: 1111111111))

    visit facility_path(facility)
    # save_and_open_page

    expect(page).to have_text(facility.name)
    expect(page).to have_text(facility.iTriage_id)
    expect(page).to have_text(facility.street)
    expect(page).to have_text(facility.city)
    expect(page).to have_text(facility.state)
    expect(page).to have_text(facility.zip)
    expect(page).to have_content("(111) 111-1111")
    expect(page).to have_text(facility.tagline)
  end

end
