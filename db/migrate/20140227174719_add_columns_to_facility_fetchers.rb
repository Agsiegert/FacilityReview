class AddColumnsToFacilityFetchers < ActiveRecord::Migration
  def change
    add_column :facility_fetchers, :latitude, :float
    add_column :facility_fetchers, :longitude, :float
  end
end
