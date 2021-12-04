require 'rails_helper'

RSpec.describe "competitions/index", type: :view do
  before(:each) do
    user = create(:user)

    allow(view).to receive(:current_user).and_return(user)

    assign(:competitions, [
      Competition.create!(
        name: "Name A",
        user: user
      ),
      Competition.create!(
        name: "Name B",
        user: user
      )
    ])
  end

  it "renders a list of competitions" do
    render
    assert_select "tr>td", text: "Name A".to_s, count: 1
    assert_select "tr>td", text: "Name B".to_s, count: 1
  end
end
