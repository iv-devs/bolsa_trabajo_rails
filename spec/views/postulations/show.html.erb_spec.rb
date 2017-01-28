require 'rails_helper'

RSpec.describe "postulations/show", type: :view do
  before(:each) do
    @postulation = assign(:postulation, Postulation.create!(
      :user => nil,
      :job => nil,
      :professional_profile => "MyText",
      :academic_profile => "MyText",
      :interest => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
