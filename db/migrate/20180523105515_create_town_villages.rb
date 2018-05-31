class CreateTownVillages < ActiveRecord::Migration
  def change
    create_table :town_villages do |t|
      t.references :sub_district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
