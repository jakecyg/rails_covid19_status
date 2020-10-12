class PrimaryMetric < ApplicationRecord
  validates :deaths, :recovered, :active, :confirmed, presence: true, numericality: true
  belongs_to :country
end
