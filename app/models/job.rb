# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  title             :string
#  job_type          :integer
#  salary            :integer
#  salary_type       :integer
#  description       :text
#  company_id        :integer
#  publish_job       :boolean
#  find_worker       :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  location_job      :string
#  category_job      :integer
#  slug              :string
#  salary_negotiable :boolean
#

class Job < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :company
  has_many :postulations, dependent: :destroy
  has_and_belongs_to_many :tags

  enum salary_type: [:hrs, :mes]
  enum job_type: [:full_time, :part_time, :freelance, :practica]
  enum category_job: [:diseno_ux, :programacion, :marketing, :desarrollo_movil, :social_media, :sys_admin]


  validates :title, uniqueness: { scope: :company , message: "Ya publicaste un trabajo con este titulo" }
  validates :title, :description, :location_job, :category_job, :job_type, presence: true 
 # validates :title, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :description, length: { maximum: 2000, too_long: "%{count} characters is the maximum allowed" }

  before_create :publish_job_type, :find_workers


  def publish_job_type
    self.publish_job ||= false
  end


  def find_workers
    self.find_worker ||= false
  end


end
