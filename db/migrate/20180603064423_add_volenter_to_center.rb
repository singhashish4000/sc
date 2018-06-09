class AddVolenterToCenter < ActiveRecord::Migration
  def change
    add_reference :centers, :volenter, index: true, foreign_key: true
  end
end
