class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :job_type, :salary, :salary_type, :description, :publish_job, :find_worker
  has_one :company
end
