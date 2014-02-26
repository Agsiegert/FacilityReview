class ReviewsController < ApplicationController

  def index
    @facility = Facility.find(params[:facility_id])
    @reviews = @facility.reviews
  end
end
