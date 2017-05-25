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

  #calbacks

  after_create :add_user_data_to_sendgrid

  def add_user_data_to_sendgrid
  		#agregar a usuario a sendGrid
  		email = self.email
  		first_name = self.name
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
  		list_id = ENV['ID_LIST_COMANY']
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
