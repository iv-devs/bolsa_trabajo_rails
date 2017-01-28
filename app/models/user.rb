# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  username               :string           not null
#  first_name             :string           not null
#  last_name              :string           not null
#  avatar                 :string
#  role                   :integer          default("0"), not null
#  description            :text             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slug                   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: :slugged
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :admin]

  has_many :postulations

  #validaciones

  validates :username, :first_name, :last_name, :description, presence: true
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :username, :first_name, :last_name, length: { in: 3..20 }
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
