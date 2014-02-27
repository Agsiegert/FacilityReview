require 'spec_helper'

describe "Viewing list of reviews" do

  it "shows the reviews for a specified facility" do
    facility1 = Facility.create!(facility_attributes(name: "CareFully"))
    review1 = facility1.reviews.create!(review_attributes(name: "Ali S"))
    review2 = facility1.reviews.create!(review_attributes(name: "J T"))


    facility2 = Facility.create!(facility_attributes(name: "Full Care"))
    review3 = facility2.reviews.create!(review_attributes(name: "P T"))

    visit facility_reviews_path(facility1)

    expect(page).to have_text(review1.name)
    expect(page).to have_text(review2.name)
    expect(page).not_to have_text(review3.name)
  end
end
