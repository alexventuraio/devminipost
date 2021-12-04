class Competition < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy

  validates :name, :user, presence: true

  accepts_nested_attributes_for :prizes, reject_if: :all_blank, allow_destroy: true
end
