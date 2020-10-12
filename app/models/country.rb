class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :primary_metrics
  belongs_to :region
end
