require 'rails_helper'

RSpec.describe "competitions/edit", type: :view do
  before(:each) do
    @competition = assign(:competition, Competition.create!(
      name: "MyString",
      user: create(:user),
    ))
    create(:prize, competition: @competition)
  end

  it "renders the edit competition form" do
    render

    assert_select "form[action=?][method=?]", competition_path(@competition), "post" do
      assert_select "input[name=?]", "competition[name]"
      assert_select "input[name=?]", "competition[prizes_attributes][0][name]"
    end
  end
end
