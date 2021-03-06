class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.text :content
      t.references :facility, index: true

      t.timestamps
    end
  end
end
