require 'rails_helper'

RSpec.describe "extras/new", type: :view do
  before(:each) do
    assign(:extra, Extra.new(
      :kind => "MyString",
      :money => 1
    ))
  end

  it "renders new extra form" do
    render

    assert_select "form[action=?][method=?]", extras_path, "post" do

      assert_select "input#extra_kind[name=?]", "extra[kind]"

      assert_select "input#extra_money[name=?]", "extra[money]"
    end
  end
end
