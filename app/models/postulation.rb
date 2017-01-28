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

class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :company 
end
