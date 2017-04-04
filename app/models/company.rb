# == Schema Information
#
# Table name: companies
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
#  failed_attempts        :integer          default("0"), not null
#  locked_at              :datetime
#  name                   :string           not null
#  logo                   :string
#  website                :string
#  descripction           :text
#  country                :string
#  tw                     :string
#  github                 :string
#  fanpage                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slug                   :string
#  linkedin               :string
#

class Company < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :logo, LogoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs, dependent: :destroy

  validates :name, :country, :descripction, :logo, presence: true
end
