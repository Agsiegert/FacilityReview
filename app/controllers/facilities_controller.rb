class FacilitiesController < ApplicationController

  def index
    @facilities = FacilityFetcher.get_facilities()
  end

  def show
    @facility = Facility.find(params[:id])
  end



end
