# == Schema Information
#
# Table name: postulations
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  job_id               :integer
#  professional_profile :text
#  academic_profile     :text
#  interest             :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  company_id           :integer
#

require 'rails_helper'

RSpec.describe Postulation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
