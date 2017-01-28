class PostulationSerializer < ActiveModel::Serializer
  attributes :id, :professional_profile, :academic_profile, :interest
  has_one :user
  has_one :job
end
