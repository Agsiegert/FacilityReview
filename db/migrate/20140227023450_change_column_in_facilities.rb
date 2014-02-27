class ChangeColumnInFacilities < ActiveRecord::Migration
  def change
    change_column :facilities, :phone, :string
  end
end
