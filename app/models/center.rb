class Center < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :district
  belongs_to :sub_district
  belongs_to :town_village
end
