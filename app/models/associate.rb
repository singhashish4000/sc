class Associate < ActiveRecord::Base
  belongs_to :payment_mode
  belongs_to :center
  belongs_to :associate_category
  belongs_to :volenter

  validates :company_name, presence: true
  validates 'authy-countries', presence: true
end
