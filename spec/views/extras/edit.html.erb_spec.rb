require 'rails_helper'

RSpec.describe "extras/edit", type: :view do
  before(:each) do
    @extra = assign(:extra, Extra.create!(
      :kind => "MyString",
      :money => 1
    ))
  end

  it "renders the edit extra form" do
    render

    assert_select "form[action=?][method=?]", extra_path(@extra), "post" do

      assert_select "input#extra_kind[name=?]", "extra[kind]"

      assert_select "input#extra_money[name=?]", "extra[money]"
    end
  end
end
