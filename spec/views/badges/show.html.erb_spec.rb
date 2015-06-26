require 'rails_helper'

RSpec.describe "badges/show", type: :view do
  before(:each) do
    @badge = assign(:badge, Badge.create!(
      :participant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
