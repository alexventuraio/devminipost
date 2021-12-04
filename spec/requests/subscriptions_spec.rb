require 'rails_helper'

RSpec.describe '/subscriptions', type: :request  do
  before do
    @user = create(:user)
    sign_in @user
  end

  describe "PUT /update" do
    it "updates current_user to become paid user" do
      put subscriptions_path, params: { user: { is_free: false } }

      expect(response).to redirect_to(competitions_path)
      follow_redirect!
      expect(response).to be_successful
      expect(response.body).to include('Thanks for subscribing.')
    end

    it "updates current_user to become paid user" do
      put subscriptions_path, params: { user: { is_free: true } }

      expect(response).to redirect_to(competitions_path)
      follow_redirect!
      expect(response).to be_successful
      expect(response.body).to include('Subscription canceled!')
    end
  end
end
