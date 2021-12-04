require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:prizes) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }

    it { should_not allow_value(nil).for(:name) }
    it { should_not allow_value(nil).for(:user) }

    # TODO: consider implementing uniqueness validation
    #it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
  end

  describe 'Nested Prizes' do
    it { should accept_nested_attributes_for(:prizes) }
    it { should accept_nested_attributes_for(:prizes).allow_destroy(true) }
  end
end
