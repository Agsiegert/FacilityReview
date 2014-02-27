class Facility < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  def recent_reviews
    reviews.order('created_at desc').limit(2)
  end
end
