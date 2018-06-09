class AddColumOfCenterTable < ActiveRecord::Migration
  def change
    add_column :centers, :phone_number ,:integer
  end
end
