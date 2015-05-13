require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        :name => "Name",
        :email => "Email"
      ),
      Participant.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
