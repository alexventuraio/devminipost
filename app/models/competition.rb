class Competition < ApplicationRecord
  belongs_to :user
  has_many :prizes, dependent: :destroy

  accepts_nested_attributes_for :prizes, reject_if: :all_blank
end
