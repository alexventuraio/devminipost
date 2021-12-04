class Prize < ApplicationRecord
  belongs_to :competition

  validates :name, :value, :competition, presence: true
  validates :value, numericality: { greater_than: 0 }
end
