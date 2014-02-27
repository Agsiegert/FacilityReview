require 'spec_helper'

describe "Create a facility review" do
  it "saves a review" do
    facility = Facility.create!(facility_attributes)

    visit facility_path(facility)

    click_on "Submit Review"

    expect(current_path).to eq(new_facility_review_path(facility))

    fill_in "Name", with: "Warren S"
    fill_in "Email", with: "ws@example.com"
    fill_in "Content", with: "I got a lollipop!, Yeah!"

    click_on "Submit Review"

    expect(current_path).to eq(facility_reviews_path(facility))

    expect(page).to have_text("Thank you for your review!")
  end

  it "does not save and invalid review" do
    facility = Facility.create!(facility_attributes)

    visit new_facility_review_path(facility)

    click_on "Submit Review"

    expect(page).to have_text("error")
  end

  it "which can also be deleted" do
    facility = Facility.create!(facility_attributes)
    review = facility.reviews.create!(review_attributes(name: "Ali S"))

    visit facility_reviews_path(facility)

    expect(facility.reviews.count).to eq(1)

    click_on "Delete Review"

    expect(facility.reviews.count).to eq(0)

    expect(current_path).to eq(facility_reviews_path(facility))

    expect(page).to have_text("The review has been deleted.")
  end

end
