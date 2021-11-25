require 'rails_helper'

RSpec.describe "competitions/index", type: :view do
  before(:each) do
    assign(:competitions, [
      Competition.create!(
        name: "Name",
        user: nil
      ),
      Competition.create!(
        name: "Name",
        user: nil
      )
    ])
  end

  it "renders a list of competitions" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
