class RemoveColumFromTable < ActiveRecord::Migration
  def change
    remove_column :associates, :first_name ,:string
    remove_column :associates, :last_name ,:string
  end
end
