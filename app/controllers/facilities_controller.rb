class FacilitiesController < ApplicationController
  include Scrivito::ControllerHelper

  before_action :fetch_scrivito_object, only: [:show]

  def index
    fetcher = FacilityFetcher.find_or_create_by(:location => params[:location])
    @facilities = fetcher.get_facilities
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def create_scrivito_obj
    FacilityData.create_for(@facility)
    redirect_to facility_path(@facility)
  end

  private

    def fetch_scrivito_object
      @obj =
        begin
          FacilityData.find_for(@facility)
        rescue Scrivito::ResourceNotFound
          # Nothing to do here, handled in template
        end
    end

end
