class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :primary_metrics
  has_many :secondary_metrics
  belongs_to :region
end
