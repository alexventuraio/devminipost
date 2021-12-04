require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:competitions) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:password) }

    it { should_not allow_value(nil).for(:full_name) }
    it { should_not allow_value(nil).for(:password) }

    # TODO: consider implementing uniqueness validation
    #it { should validate_uniqueness_of(:full_name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
