require 'rails_helper'

RSpec.describe "participants/show", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :name => "",
      :email => "",
      :appeared => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
