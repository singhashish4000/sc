class CreateVolenters < ActiveRecord::Migration
  def change
    create_table :volenters do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.text :address
      t.integer :phone_no
      t.string :adhaar_no
      t.references :center, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
