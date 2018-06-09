class Associate < ActiveRecord::Base
  belongs_to :payment_mode
  belongs_to :center
  belongs_to :associate_category

  validates :company_name, presence: true
  validates :company_name, presence: true
end
