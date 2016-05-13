class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i(facebook)

  has_many :authorizations

  def self.from_omniauth(auth)
    first_or_create do |user|
      # user.provider = auth.provider
      # user.uid = auth.uid
      user.full_name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
