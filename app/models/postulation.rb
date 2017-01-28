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
#

class Postulation < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :user_id, :job_id, :professional_profile, :academic_profile, :interest, presence: true
  validates :professional_profile, length: { maximum: 3000, too_long: "%{count} characters is the maximum allowed" }
  validates :academic_profile, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :interest, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }
end
