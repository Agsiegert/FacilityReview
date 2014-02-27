class CreateFacilityFetchers < ActiveRecord::Migration
  def change
    create_table :facility_fetchers do |t|

      t.timestamps
    end
  end
end
