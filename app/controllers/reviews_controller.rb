class ReviewsController < ApplicationController
  respond_to :html, :json
  before_action :set_facility

  def index
    @reviews = @facility.reviews
    respond_with(@reviews)
  end

  def new
    @review = @facility.reviews.new
  end

  def create
    @review = @facility.reviews.new(review_params)
    if @review.save
      redirect_to facility_reviews_path(@facility),
                        notice: "Thank you for your review!"
    else
      render :new
    end
  end

  def destroy
    @review = @facility.reviews.find(params[:id])
    @review.destroy
    redirect_to facility_reviews_path(@facility), notice: "The review has been deleted."
  end

  private

  def review_params
    params.require(:review).permit(:name, :email, :content)
  end

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
