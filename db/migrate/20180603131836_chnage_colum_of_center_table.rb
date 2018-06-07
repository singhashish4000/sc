class ChnageColumOfCenterTable < ActiveRecord::Migration
  def change
    remove_column :centers, :phone_no, :integer
  end
end
