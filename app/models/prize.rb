class Prize < ApplicationRecord
  belongs_to :competition

  validates :name, :value, :competition, presence: true
end
