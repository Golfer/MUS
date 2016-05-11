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

  validates_presence_of :email, :full_name
  has_many :authorizations

  class << self
    def omniauth_user(user)
      first_or_create(
          email: user.email,
          full_name: user.name,
          password: Devise.friendly_token[0, 20]
      )
    end
  end
end
