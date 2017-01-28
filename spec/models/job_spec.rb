# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  title        :string
#  job_type     :integer
#  salary       :integer
#  salary_type  :integer
#  description  :text
#  company_id   :integer
#  publish_job  :boolean
#  find_worker  :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  location_job :string
#  category_job :integer
#

require 'rails_helper'

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
