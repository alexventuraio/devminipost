require 'rails_helper'

RSpec.describe Prize, type: :model do
  describe 'Associations' do
    it { should belong_to(:competition) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:competition) }

    it { should_not allow_value(nil).for(:name) }
    it { should_not allow_value(nil).for(:value) }
    it { should_not allow_value(nil).for(:competition) }

    it { should validate_numericality_of(:value) }
    it { should validate_numericality_of(:value).is_greater_than(0) }

    # TODO: consider implementing uniqueness validation
    #it { should validate_uniqueness_of(:name).scoped_to(:competition_id) }
  end
end
