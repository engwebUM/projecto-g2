require 'rails_helper'

RSpec.describe "extras/index", type: :view do
  before(:each) do
    assign(:extras, [
      Extra.create!(
        :kind => "Kind",
        :money => 1
      ),
      Extra.create!(
        :kind => "Kind",
        :money => 1
      )
    ])
  end

  it "renders a list of extras" do
    render
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
