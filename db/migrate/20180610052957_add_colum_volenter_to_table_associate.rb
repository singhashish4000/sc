class AddColumVolenterToTableAssociate < ActiveRecord::Migration
  def change
    add_reference :associates, :volenter, index: true, foreign_key: true
  end
end
