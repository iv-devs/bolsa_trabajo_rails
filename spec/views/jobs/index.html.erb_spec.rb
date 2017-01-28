require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :title => "Title",
        :job_type => 2,
        :salary => 3,
        :salary_type => 4,
        :description => "MyText",
        :company => nil,
        :publish_job => false,
        :find_worker => false
      ),
      Job.create!(
        :title => "Title",
        :job_type => 2,
        :salary => 3,
        :salary_type => 4,
        :description => "MyText",
        :company => nil,
        :publish_job => false,
        :find_worker => false
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
