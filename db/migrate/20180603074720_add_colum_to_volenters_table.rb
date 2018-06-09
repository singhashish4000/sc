class AddColumToVolentersTable < ActiveRecord::Migration
  def change
    add_column :volenters,:is_admin ,:boolean
    add_column :volenters,:is_super_admin ,:boolean
  end
end
