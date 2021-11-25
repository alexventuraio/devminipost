require 'rails_helper'

RSpec.describe "competitions/new", type: :view do
  before(:each) do
    assign(:competition, Competition.new(
      name: "MyString",
      user: nil
    ))
  end

  it "renders new competition form" do
    render

    assert_select "form[action=?][method=?]", competitions_path, "post" do

      assert_select "input[name=?]", "competition[name]"

      assert_select "input[name=?]", "competition[user_id]"
    end
  end
end