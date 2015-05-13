require 'rails_helper'

RSpec.describe "extras/show", type: :view do
  before(:each) do
    @extra = assign(:extra, Extra.create!(
      :kind => "Kind",
      :money => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/1/)
  end
end
