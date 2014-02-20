class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.integer :iTriage_id
      t.string :name
      t.integer :phone
      t.integer :distance
      t.float :lat
      t.float :lng
      t.text :tagline
      t.string :logo_url
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
