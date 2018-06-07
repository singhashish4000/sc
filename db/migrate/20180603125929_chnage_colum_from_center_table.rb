class ChnageColumFromCenterTable < ActiveRecord::Migration
  def change
    change_column :centers, :no_of_volenters, :integer, :default => 0
    change_column :volenters, :phone_no, :integer
  end
end
