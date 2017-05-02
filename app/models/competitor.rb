class Competitor < ApplicationRecord
  belongs_to :group
  has_many :laptimes
end
