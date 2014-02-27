require 'spec_helper'

describe "A review" do

  it "belongs to a facility" do
    facility = Facility.create!(facility_attributes)

    review = facility.reviews.new(review_attributes)

    expect(review.facility).to eq(facility)
  end

  it "example attributes are valid" do
    review = Review.new(review_attributes)

    expect(review.valid?).to be_true
  end

  it "requires a name" do
    review = Review.new(name: "")

    expect(review.valid?).to be_false
    expect(review.errors[:name].any?).to be_true
  end

  xit "should change name to initials" do
  end

  it "requires an email" do
    review = Review.new(email: "")

    expect(review.valid?).to be_false
    expect(review.errors[:email].any?).to be_true
  end

  xit "should have a valid email" do
  end

  it "requires content" do
    review = Review.new(content: "")

    expect(review.valid?).to be_false
    expect(review.errors[:content].any?).to be_true
  end

  it "requires content over 10 characters" do
    review = Review.new(content: "X" * 10)

    expect(review.valid?).to be_false
    expect(review.errors[:content].any?).to be_true
  end

  # it "accepts star values of 1 through 5" do
  #   stars = [1, 2, 3, 4, 5]
  #   stars.each do |star|
  #     review = Review.new(stars: star)

  #     expect(review.valid?).to be_false
  #     expect(review.errors[:stars].any?).to be_false
  #   end
  # end

  # it "rejects invalid star values" do
  #   stars = [-1, 0, 6]
  #   stars.each do |star|
  #     review = Review.new(stars: star)

  #     expect(review.valid?).to be_false
  #     expect(review.errors[:stars].any?).to be_true
  #     expect(review.errors[:stars].first).to eq("must be between 1 and 5")
  #   end
  # end
end
