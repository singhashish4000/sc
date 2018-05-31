class CreateSubDistricts < ActiveRecord::Migration
  def change
    create_table :sub_districts do |t|
      t.string :name
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
