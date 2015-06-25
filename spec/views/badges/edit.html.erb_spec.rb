require 'rails_helper'

RSpec.describe "badges/edit", type: :view do
  before(:each) do
    @badge = assign(:badge, Badge.create!(
      :participant => nil
    ))
  end

  it "renders the edit badge form" do
    render

    assert_select "form[action=?][method=?]", badge_path(@badge), "post" do

      assert_select "input#badge_participant_id[name=?]", "badge[participant_id]"
    end
  end
end
