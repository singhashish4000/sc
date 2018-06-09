class CreateAssociateCategories < ActiveRecord::Migration
  def change
    create_table :associate_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
