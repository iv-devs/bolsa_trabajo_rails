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

class Job < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :company
  has_many :postulations

  enum salary_type: [:hrs, :mes]
  enum job_type: [:full_time, :part_time, :freelance, :practica]
  enum category_job: [:diseno_ux, :programacion, :marketing, :desarrollo_movil, :social_media, :sys_admin]
end
