class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :name
      t.text :address
      t.integer :no_of_volunters
      t.references :country, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.references :sub_district, index: true, foreign_key: true
      t.references :town_village, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
