require 'rails_helper'

RSpec.describe "participants/edit", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :name => "",
      :email => "",
      :appeared => false
    ))
  end

  it "renders the edit participant form" do
    render

    assert_select "form[action=?][method=?]", participant_path(@participant), "post" do

      assert_select "input#participant_name[name=?]", "participant[name]"

      assert_select "input#participant_email[name=?]", "participant[email]"

      assert_select "input#participant_appeared[name=?]", "participant[appeared]"
    end
  end
end
