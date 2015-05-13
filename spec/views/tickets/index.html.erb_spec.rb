require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :kind => "Kind",
        :money => 1
      ),
      Ticket.create!(
        :kind => "Kind",
        :money => 1
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
