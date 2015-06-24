require 'rails_helper'

RSpec.describe "participants/new", type: :view do
  before(:each) do
    assign(:participant, Participant.new(
      :name => "",
      :email => "",
      :appeared => false
    ))
  end

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

      assert_select "input#participant_name[name=?]", "participant[name]"

      assert_select "input#participant_email[name=?]", "participant[email]"

      assert_select "input#participant_appeared[name=?]", "participant[appeared]"
    end
  end
end
