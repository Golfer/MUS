class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i(google_oauth2 facebook)

  has_many :authorizations

  class << self
  end
end
