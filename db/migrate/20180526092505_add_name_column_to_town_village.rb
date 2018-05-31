class AddNameColumnToTownVillage < ActiveRecord::Migration
  def change
    add_column :town_villages, :name, :string
  end
end
