require 'spec_helper'

describe "A facility" do
  it "gets it facilities from iTriage API" do
    visit root_path
    fill_in "location", with: "80204"
    click_on "Find Facilities"

    expect(page).to have_text("20 Facilities found")
  end

  it "has many reviews" do
    facility = Facility.new(facility_attributes)

    review1 = facility.reviews.new(review_attributes)
    review2 = facility.reviews.new(review_attributes)

    expect(facility.reviews).to include(review1)
    expect(facility.reviews).to include(review2)
  end

  it "deletes associated reviews" do
    facility = Facility.create(facility_attributes)

    facility.reviews.create(review_attributes)

    expect {
      facility.destroy
    }.to change(Review, :count).by(-1)
  end
end
