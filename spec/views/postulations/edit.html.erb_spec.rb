require 'rails_helper'

RSpec.describe "postulations/edit", type: :view do
  before(:each) do
    @postulation = assign(:postulation, Postulation.create!(
      :user => nil,
      :job => nil,
      :professional_profile => "MyText",
      :academic_profile => "MyText",
      :interest => "MyText"
    ))
  end

  it "renders the edit postulation form" do
    render

    assert_select "form[action=?][method=?]", postulation_path(@postulation), "post" do

      assert_select "input#postulation_user_id[name=?]", "postulation[user_id]"

      assert_select "input#postulation_job_id[name=?]", "postulation[job_id]"

      assert_select "textarea#postulation_professional_profile[name=?]", "postulation[professional_profile]"

      assert_select "textarea#postulation_academic_profile[name=?]", "postulation[academic_profile]"

      assert_select "textarea#postulation_interest[name=?]", "postulation[interest]"
    end
  end
end
