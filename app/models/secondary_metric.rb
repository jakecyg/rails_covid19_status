class SecondaryMetric < ApplicationRecord
  validates :deathPerHundred, :recoveredPerHundred, :deathPerHundredRecovered, presence: true, numericality: true
  belongs_to :country
end
