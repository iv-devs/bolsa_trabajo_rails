require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "MyString",
      :job_type => 1,
      :salary => 1,
      :salary_type => 1,
      :description => "MyText",
      :company => nil,
      :publish_job => false,
      :find_worker => false
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input#job_title[name=?]", "job[title]"

      assert_select "input#job_job_type[name=?]", "job[job_type]"

      assert_select "input#job_salary[name=?]", "job[salary]"

      assert_select "input#job_salary_type[name=?]", "job[salary_type]"

      assert_select "textarea#job_description[name=?]", "job[description]"

      assert_select "input#job_company_id[name=?]", "job[company_id]"

      assert_select "input#job_publish_job[name=?]", "job[publish_job]"

      assert_select "input#job_find_worker[name=?]", "job[find_worker]"
    end
  end
end
