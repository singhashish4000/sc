class Associate < ActiveRecord::Base
  belongs_to :payment_mode
  belongs_to :center
end
