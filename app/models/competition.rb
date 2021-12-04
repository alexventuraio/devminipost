class Competition < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy

  validates :name, :user, presence: true

  # Since `limit` is based on User and can be unlimited, then we should not set it here
  accepts_nested_attributes_for :prizes, reject_if: :all_blank, allow_destroy: true
end
