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


  #calbacks
  
  after_create :add_user_data_to_sendgrid

  def add_user_data_to_sendgrid
      #agregar a usuario a sendGrid
      email = self.email
      first_name = self.first_name
      api_id = ENV['API_SENDGRID']
      uri = URI('https://api.sendgrid.com/v3/contactdb/recipients')
      params = [{'first_name': first_name, 'email': email}]
      response = http_send_to_sendgrid(uri, params, api_id)
      parse =  JSON.parse(response.body)      
      parse['persisted_recipients'].each do |x|
        send_user_data_to_list_sendgrid(x, api_id)
      end

  end
  def send_user_data_to_list_sendgrid(params, api_id)
      #agregar a usuario a la lista comañia de sendGrid
      api_id = api_id
      list_id = ENV['ID_LIST_DEV']
      uri = URI("https://api.sendgrid.com/v3/contactdb/lists/#{list_id}/recipients/#{params}")
      response = http_send_to_sendgrid(uri, nil, api_id)
      response.body
  end

  private

    def http_send_to_sendgrid(uri, params = nil, api_id)
      uri = uri
      params = params
      api_id = api_id
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.request_uri)
      request.add_field("Authorization", "Bearer #{api_id}")
      request.add_field("Content-Type", "application/json")
      request.add_field("Accept", "application/json")
      request.body = params.to_json
      response = http.request(request)
      response
    end


end
