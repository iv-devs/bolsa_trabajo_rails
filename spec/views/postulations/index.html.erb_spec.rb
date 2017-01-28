require 'rails_helper'

RSpec.describe "postulations/index", type: :view do
  before(:each) do
    assign(:postulations, [
      Postulation.create!(
        :user => nil,
        :job => nil,
        :professional_profile => "MyText",
        :academic_profile => "MyText",
        :interest => "MyText"
      ),
      Postulation.create!(
        :user => nil,
        :job => nil,
        :professional_profile => "MyText",
        :academic_profile => "MyText",
        :interest => "MyText"
      )
    ])
  end

  it "renders a list of postulations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
