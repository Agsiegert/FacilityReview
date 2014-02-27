class FacilitiesController < ApplicationController

  def index
    fetcher = FacilityFetcher.find_or_create_by(:location => params[:location])
    @facilities = fetcher.get_facilities
  end

  def show
    @facility = Facility.find(params[:id])
  end

end
