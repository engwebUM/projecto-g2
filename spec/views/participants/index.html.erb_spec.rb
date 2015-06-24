require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        :name => "",
        :email => "",
        :appeared => false
      ),
      Participant.create!(
        :name => "",
        :email => "",
        :appeared => false
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
