class Facility < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  # geocoded_by :address ||  :IP address
  # after_validation :geocode

  def recent_reviews
    reviews.order('created_at desc').limit(2)
  end
end
