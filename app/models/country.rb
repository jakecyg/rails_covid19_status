class Country < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :region
end
