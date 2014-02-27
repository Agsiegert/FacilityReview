class AddLocationToFacilityFetchers < ActiveRecord::Migration
  def change
    add_column :facility_fetchers, :location, :string
  end
end
