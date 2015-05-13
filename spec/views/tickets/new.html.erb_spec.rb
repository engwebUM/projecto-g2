require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :kind => "MyString",
      :money => 1
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input#ticket_kind[name=?]", "ticket[kind]"

      assert_select "input#ticket_money[name=?]", "ticket[money]"
    end
  end
end
