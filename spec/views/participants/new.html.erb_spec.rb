require 'rails_helper'

RSpec.describe "participants/new", type: :view do
  before(:each) do
    assign(:participant, Participant.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

      assert_select "input#participant_name[name=?]", "participant[name]"

      assert_select "input#participant_email[name=?]", "participant[email]"
    end
  end
end
