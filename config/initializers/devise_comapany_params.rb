class Company::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :logo, :website, :descripction, :country, :tw, :github, :fanpage])
  end
end