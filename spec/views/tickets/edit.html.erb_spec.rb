require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :kind => "MyString",
      :money => 1
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input#ticket_kind[name=?]", "ticket[kind]"

      assert_select "input#ticket_money[name=?]", "ticket[money]"
    end
  end
end
