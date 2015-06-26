require 'rails_helper'

RSpec.describe "badges/new", type: :view do
  before(:each) do
    assign(:badge, Badge.new(
      :participant => nil
    ))
  end

  it "renders new badge form" do
    render

    assert_select "form[action=?][method=?]", badges_path, "post" do

      assert_select "input#badge_participant_id[name=?]", "badge[participant_id]"
    end
  end
end
