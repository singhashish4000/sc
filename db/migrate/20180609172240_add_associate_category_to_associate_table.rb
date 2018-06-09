class AddAssociateCategoryToAssociateTable < ActiveRecord::Migration
  def change
    add_reference :associates, :associate_category, index: true, foreign_key: true
  end
end
